module Api
  class SessionsController < Devise::SessionsController
    skip_before_action :verify_signed_out_user, only: :destroy
    protect_from_forgery with: :null_session

    before_action :ensure_params_exist, :load_user, only: :create
    before_action :valid_token, only: :destroy

    def create
      if user.valid_password? sign_in_params[:password]
        sign_in "user", user
        render json: {
          messages: I18n.t("devise.sessions.signed_in"),
          data: {user_info: {id: user.id, name: user.name}}
        }, status: :ok
      else
        invalid_login_attempt
      end
    end

    def destroy
      sign_out user
      user.generate_new_authentication_token
      render json: {
        messages: I18n.t("devise.sessions.signed_out")
      }, status: :ok
    end

    private

    attr_reader :user

    def sign_in_params
      params.require(:sign_in).permit :email, :password
    end

    def ensure_params_exist
      return if params[:sign_in].present?
      render json: {
        messages: I18n.t("api.missing_params")
      }, status: :unauthorized
    end

    def invalid_login_attempt
      render json: {
        messages: I18n.t("devise.failure.invalid", authentication_keys: "email")
      }, status: :unauthorized
    end

    def load_user
      @user =
        User.find_for_database_authentication email: sign_in_params[:email]

      return if user
      render json: {
        messages: I18n.t("devise.failure.invalid", authentication_keys: "email")
      }, status: :not_found
    end

    def valid_token
      @user =
        User.find_by authentication_token: request.headers["MS-AUTH-TOKEN"]

      return if user
      render json: {
        messages: I18n.t("api.invalid_token")
      }, status: :not_found
    end
  end
end
