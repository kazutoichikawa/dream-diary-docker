class CreateDreams < ActiveRecord::Migration[6.1]
  def change
    create_table :dreams do |t|
      t.string :title, null: false
      t.text :discription, null: false
      t.date :date, null: false
      t.timestamps
    end
  end
end
