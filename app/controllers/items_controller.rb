class ItemsController < ApplicationController
  before_action :new_item, only: :create
  load_and_authorize_resource

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    if params[:category_id]
      @item.categories << Category.find(params[:category_id])
    end
    build_child_object(3)
  end

  # GET /items/1/edit
  def edit
    build_child_object(2)
  end

  # POST /items
  # POST /items.json
  def create
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: "#{t('item').capitalize} #{t('was_created')}." }
      else
        build_child_object(3)
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update!(item_params)
        format.html { redirect_to @item, notice: "#{t('item').capitalize} #{t('was_updated')}." }
      else
        build_child_object(2)
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def new_item
      @item = Item.new(item_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :price, :active, :small_print,
        :category_ids => [], 
        :images_attributes    => [:id, :image], 
        :documents_attributes => [:id, :document], 
        :downloads_attributes => [:id, :name, :file])
    end

    def build_child_object(n=3)
      n.times { @item.images.build }
      (n - 1).times { @item.downloads.build }
      n.times { @item.documents.build }
    end
end
