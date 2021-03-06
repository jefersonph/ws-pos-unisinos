require 'test_helper'

class LendsControllerTest < ActionController::TestCase
  setup do
    @lend = lends(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lend" do
    assert_difference('Lend.count') do
      post :create, lend: { game_id: @lend.game_id, to: @lend.to }
    end

    assert_redirected_to lend_path(assigns(:lend))
  end

  test "should show lend" do
    get :show, id: @lend
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lend
    assert_response :success
  end

  test "should update lend" do
    put :update, id: @lend, lend: { game_id: @lend.game_id, to: @lend.to }
    assert_redirected_to lend_path(assigns(:lend))
  end

  test "should destroy lend" do
    assert_difference('Lend.count', -1) do
      delete :destroy, id: @lend
    end

    assert_redirected_to lends_path
  end
end
