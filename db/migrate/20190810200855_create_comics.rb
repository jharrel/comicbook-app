class CreateComics < ActiveRecord::Migration[4.2]
  def change
    create_table :comics do |t|
      t.string :title
      t.string :publisher
      t.integer :issue

      t.timestamps null: false
    end
  end
end
