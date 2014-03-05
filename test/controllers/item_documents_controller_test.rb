require 'test_helper'

class ItemDocumentsControllerTest < ActionController::TestCase
  setup do
    @item_document = item_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_document" do
    assert_difference('ItemDocument.count') do
      post :create, item_document: { document_content_type: @item_document.document_content_type, document_file_name: @item_document.document_file_name, document_file_size: @item_document.document_file_size, document_updated_at: @item_document.document_updated_at, item_id: @item_document.item_id }
    end

    assert_redirected_to item_document_path(assigns(:item_document))
  end

  test "should show item_document" do
    get :show, id: @item_document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_document
    assert_response :success
  end

  test "should update item_document" do
    patch :update, id: @item_document, item_document: { document_content_type: @item_document.document_content_type, document_file_name: @item_document.document_file_name, document_file_size: @item_document.document_file_size, document_updated_at: @item_document.document_updated_at, item_id: @item_document.item_id }
    assert_redirected_to item_document_path(assigns(:item_document))
  end

  test "should destroy item_document" do
    assert_difference('ItemDocument.count', -1) do
      delete :destroy, id: @item_document
    end

    assert_redirected_to item_documents_path
  end
end
