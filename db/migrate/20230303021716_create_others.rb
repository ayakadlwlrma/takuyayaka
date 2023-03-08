class CreateOthers < ActiveRecord::Migration[6.1]
  def change
    create_table :others do |t|
      t.string :song
      t.string :singer
      t.text :text
      t.string :voice
      t.string :movie

      t.timestamps
    end
  end
end
