require 'test_helper'

class AvailablitiesControllerTest < ActionController::TestCase
  setup do
    @availablity = availablities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:availablities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create availablity" do
    assert_difference('Availablity.count') do
      post :create, availablity: {  }
    end

    assert_redirected_to availablity_path(assigns(:availablity))
  end

  test "should show availablity" do
    get :show, id: @availablity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @availablity
    assert_response :success
  end

  test "should update availablity" do
    patch :update, id: @availablity, availablity: {  }
    assert_redirected_to availablity_path(assigns(:availablity))
  end

  test "should destroy availablity" do
    assert_difference('Availablity.count', -1) do
      delete :destroy, id: @availablity
    end

    assert_redirected_to availablities_path
  end
end
