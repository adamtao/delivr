class AddSmallPrintToItems < ActiveRecord::Migration
  def change
    add_column :items, :small_print, :text
  end
end
