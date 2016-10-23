class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end
    add_index :tags, :name, unique: true
  end
end