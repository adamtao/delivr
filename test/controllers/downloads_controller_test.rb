require 'test_helper'

class DownloadsControllerTest < ActionController::TestCase
  setup do
    @download = downloads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:downloads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create download" do
    assert_difference('Download.count') do
      post :create, download: { file_content_type: @download.file_content_type, file_file_name: @download.file_file_name, file_file_size: @download.file_file_size, file_updated_at: @download.file_updated_at, item_id: @download.item_id, name: @download.name }
    end

    assert_redirected_to download_path(assigns(:download))
  end

  test "should show download" do
    get :show, id: @download
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @download
    assert_response :success
  end

  test "should update download" do
    patch :update, id: @download, download: { file_content_type: @download.file_content_type, file_file_name: @download.file_file_name, file_file_size: @download.file_file_size, file_updated_at: @download.file_updated_at, item_id: @download.item_id, name: @download.name }
    assert_redirected_to download_path(assigns(:download))
  end

  test "should destroy download" do
    assert_difference('Download.count', -1) do
      delete :destroy, id: @download
    end

    assert_redirected_to downloads_path
  end
end
