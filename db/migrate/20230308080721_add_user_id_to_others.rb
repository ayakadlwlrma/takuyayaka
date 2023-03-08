class AddUserIdToOthers < ActiveRecord::Migration[6.1]
  def change
    add_column :others, :user_id, :integer
  end
end
