require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    @page = pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pages)
  end

  test "should get form" do
    get :form
    assert_response :success
  end

  test "should create page" do
    assert_difference('Page.count') do
      post :create, page: { image: @page.image, name: @page.name, page_no: @page.page_no, user_id: @page.user_id }
    end

    assert_redirected_to page_path(assigns(:page))
  end

  test "should show page" do
    get :show, id: @page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page
    assert_response :success
  end

  test "should update page" do
    patch :update, id: @page, page: { image: @page.image, name: @page.name, page_no: @page.page_no, user_id: @page.user_id }
    assert_redirected_to page_path(assigns(:page))
  end

  test "should destroy page" do
    assert_difference('Page.count', -1) do
      delete :destroy, id: @page
    end

    assert_redirected_to pages_path
  end
end
