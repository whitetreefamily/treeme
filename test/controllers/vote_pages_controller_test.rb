require 'test_helper'

class VotePagesControllerTest < ActionController::TestCase
  setup do
    @vote_page = vote_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vote_pages)
  end

  test "should get form" do
    get :form
    assert_response :success
  end

  test "should create vote_page" do
    assert_difference('VotePage.count') do
      post :create, vote_page: { name: @vote_page.name, user_id: @vote_page.user_id }
    end

    assert_redirected_to vote_page_path(assigns(:vote_page))
  end

  test "should show vote_page" do
    get :show, id: @vote_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vote_page
    assert_response :success
  end

  test "should update vote_page" do
    patch :update, id: @vote_page, vote_page: { name: @vote_page.name, user_id: @vote_page.user_id }
    assert_redirected_to vote_page_path(assigns(:vote_page))
  end

  test "should destroy vote_page" do
    assert_difference('VotePage.count', -1) do
      delete :destroy, id: @vote_page
    end

    assert_redirected_to vote_pages_path
  end
end
