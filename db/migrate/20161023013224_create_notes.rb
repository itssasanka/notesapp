class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.string :tag

      t.timestamps
    end
    add_index :notes, :tag, unique: true
  end
end
