require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post :create, category: { description: @category.description, header_image_content_type: @category.header_image_content_type, header_image_file_name: @category.header_image_file_name, header_image_file_size: @category.header_image_file_size, header_image_updated_at: @category.header_image_updated_at, name: @category.name, slug: @category.slug }
    end

    assert_redirected_to category_path(assigns(:category))
  end

  test "should show category" do
    get :show, id: @category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category
    assert_response :success
  end

  test "should update category" do
    patch :update, id: @category, category: { description: @category.description, header_image_content_type: @category.header_image_content_type, header_image_file_name: @category.header_image_file_name, header_image_file_size: @category.header_image_file_size, header_image_updated_at: @category.header_image_updated_at, name: @category.name, slug: @category.slug }
    assert_redirected_to category_path(assigns(:category))
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, id: @category
    end

    assert_redirected_to categories_path
  end
end
