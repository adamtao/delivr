class AddDownloadCounterToDownloads < ActiveRecord::Migration
  def change
    add_column :downloads, :counter, :integer
  end
end
