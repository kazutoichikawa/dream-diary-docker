class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.references :dream, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
