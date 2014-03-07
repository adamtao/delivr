class ItemDocumentsController < ApplicationController
  load_and_authorize_resource :item
  load_and_authorize_resource

  # DELETE /item_documents/1
  # DELETE /item_documents/1.json
  def destroy
    @item_document.destroy
    respond_to do |format|
      format.html { redirect_to edit_item_path(@item) }
    end
  end

end
