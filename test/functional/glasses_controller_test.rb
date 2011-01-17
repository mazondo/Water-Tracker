require 'test_helper'

class GlassesControllerTest < ActionController::TestCase
  setup do
    @glass = glasses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:glasses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create glass" do
    assert_difference('Glass.count') do
      post :create, :glass => @glass.attributes
    end

    assert_redirected_to glass_path(assigns(:glass))
  end

  test "should show glass" do
    get :show, :id => @glass.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @glass.to_param
    assert_response :success
  end

  test "should update glass" do
    put :update, :id => @glass.to_param, :glass => @glass.attributes
    assert_redirected_to glass_path(assigns(:glass))
  end

  test "should destroy glass" do
    assert_difference('Glass.count', -1) do
      delete :destroy, :id => @glass.to_param
    end

    assert_redirected_to glasses_path
  end
end
