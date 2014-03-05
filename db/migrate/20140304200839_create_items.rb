class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.money :price

      t.timestamps
    end
    add_index :items, :slug
  end
end
