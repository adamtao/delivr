class ItemImagesController < ApplicationController
  load_and_authorize_resource :item
  load_and_authorize_resource

  # GET /item_images/1
  # GET /item_images/1.json
  def show
  end

  # PATCH/PUT /item_images/1
  # PATCH/PUT /item_images/1.json
  def update
    respond_to do |format|
      if @item_image.update(item_image_params)
        format.html { redirect_to [@item, @item_image], notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'show' }
        format.json { render json: @item_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_images/1
  # DELETE /item_images/1.json
  def destroy
    @item_image.destroy
    respond_to do |format|
      format.html { redirect_to @item }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def item_image_params
      params.require(:item_image).permit(:item_id, :image)
    end

end
