class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.integer :reporter_id
      t.integer :reported_id
      t.string :reported_type
      t.string :content

      t.timestamps
    end
  end
end
