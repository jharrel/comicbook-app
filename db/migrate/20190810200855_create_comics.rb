class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :title
      t.string :publisher
      t.integer :issue

      t.timestamps null: false
    end
  end
end
