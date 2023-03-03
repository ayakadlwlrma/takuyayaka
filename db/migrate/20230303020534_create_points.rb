class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|
      t.string :song
      t.float :point
      t.string :image

      t.timestamps
    end
  end
end
