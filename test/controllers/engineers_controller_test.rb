require 'test_helper'

class EngineersControllerTest < ActionController::TestCase
  setup do
    @engineer = engineers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:engineers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create engineer" do
    assert_difference('Engineer.count') do
      post :create, engineer: { name: @engineer.name, phone: @engineer.phone, tokens: @engineer.tokens }
    end

    assert_redirected_to engineer_path(assigns(:engineer))
  end

  test "should show engineer" do
    get :show, id: @engineer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @engineer
    assert_response :success
  end

  test "should update engineer" do
    patch :update, id: @engineer, engineer: { name: @engineer.name, phone: @engineer.phone, tokens: @engineer.tokens }
    assert_redirected_to engineer_path(assigns(:engineer))
  end

  test "should destroy engineer" do
    assert_difference('Engineer.count', -1) do
      delete :destroy, id: @engineer
    end

    assert_redirected_to engineers_path
  end
end
