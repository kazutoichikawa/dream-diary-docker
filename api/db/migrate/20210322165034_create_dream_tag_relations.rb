class CreateDreamTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :dream_tag_relations do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
