class ItemDocumentsController < ApplicationController
  before_action :new_item_document, only: :create
  load_and_authorize_resource :item
  load_and_authorize_resource

  # GET /item_documents
  # GET /item_documents.json
  def index
  end

  # GET /item_documents/1
  # GET /item_documents/1.json
  def show
  end

  # GET /item_documents/new
  def new
  end

  # GET /item_documents/1/edit
  def edit
  end

  # POST /item_documents
  # POST /item_documents.json
  def create
    respond_to do |format|
      if @item_document.save
        format.html { redirect_to @item_document, notice: 'Item document was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item_document }
      else
        format.html { render action: 'new' }
        format.json { render json: @item_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_documents/1
  # PATCH/PUT /item_documents/1.json
  def update
    respond_to do |format|
      if @item_document.update(item_document_params)
        format.html { redirect_to @item_document, notice: 'Item document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_documents/1
  # DELETE /item_documents/1.json
  def destroy
    @item_document.destroy
    respond_to do |format|
      format.html { redirect_to @item }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def new_item_document
      @item_document = ItemDocument.new(item_document_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_document_params
      params.require(:item_document).permit(:item_id, :document)
    end
end
