class AddUserIdToPoints < ActiveRecord::Migration[6.1]
  def change
    add_column :points, :user_id, :integer
  end
end
