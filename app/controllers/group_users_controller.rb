class GroupUsersController < ApplicationController
  before_action :check_size, only: :create

  def create
    @group_user = current_user.group_users.build group_user_params
    if @group_user.save
      flash[:success] = t ".created_group_user"
      redirect_to group_path @group
    else
      flash[:error] = t ".not_created_group_user"
      redirect_to groups_path
    end
  end

  def destroy
    @group_user = GroupUser.find_by id: params[:id]
    if @group_user.present?
      @group_user.destroy
      @group_user.group.leave_groups.create user: @group_user.user
      respond_to do |format|
        format.html{redirect_to groups_path}
        format.js
      end
    else
      flash[:error] = t "not_found_group_user"
      redirect_to groups_path
    end
  end

  private
  def group_user_params
    params.require(:group_user).permit :user_id, :group_id
  end

  def check_size
    @group = Group.find_by id: group_user_params[:group_id]
    total_join = @group.users.count
    size_default = @group.size
    if total_join == size_default
      flash[:error] = t ".not_join"
      redirect_to groups_path
    end
  end
end
