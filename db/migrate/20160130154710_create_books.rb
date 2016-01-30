class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :tags
      t.string :author
      t.text :description

      t.timestamps null: false
    end
  end
end
