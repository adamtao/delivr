class CategoriesController < ApplicationController
  before_action :new_category, only: :create
  load_and_authorize_resource

  # GET /categories
  # GET /categories.json
  def index
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: "#{category} #{t('was_created')}." }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: "#{t('category')} #{t('was_updated')}." }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def delete_banner
    @category.header_image = nil
    @category.save
    redirect_to edit_category_path(@category)
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def new_category
      @category = Category.new(category_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description, :header_image)
    end
end
