class DownloadsController < ApplicationController
  load_and_authorize_resource :item, only: :destroy
  load_and_authorize_resource

  def download
    @download.increment_counter
    authorize! :download, @download
    send_file @download.file.path, 
      disposition: :attachment, 
      content_type: @download.file_content_type
  end

  # DELETE /downloads/1
  # DELETE /downloads/1.json
  def destroy
    @download.destroy
    respond_to do |format|
      format.html { redirect_to edit_item_path(@item) }
    end
  end

end
