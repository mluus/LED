require 'test_helper'

class RenteesControllerTest < ActionController::TestCase
  setup do
    @rentee = rentees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rentees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rentee" do
    assert_difference('Rentee.count') do
      post :create, rentee: { address: @rentee.address, name: @rentee.name, phone: @rentee.phone, tokens: @rentee.tokens }
    end

    assert_redirected_to rentee_path(assigns(:rentee))
  end

  test "should show rentee" do
    get :show, id: @rentee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rentee
    assert_response :success
  end

  test "should update rentee" do
    patch :update, id: @rentee, rentee: { address: @rentee.address, name: @rentee.name, phone: @rentee.phone, tokens: @rentee.tokens }
    assert_redirected_to rentee_path(assigns(:rentee))
  end

  test "should destroy rentee" do
    assert_difference('Rentee.count', -1) do
      delete :destroy, id: @rentee
    end

    assert_redirected_to rentees_path
  end
end
