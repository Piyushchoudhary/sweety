require 'test_helper'

class GlucodeLevelsControllerTest < ActionController::TestCase
  setup do
    @glucode_level = glucode_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:glucode_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create glucode_level" do
    assert_difference('GlucodeLevel.count') do
      post :create, glucode_level: {  }
    end

    assert_redirected_to glucode_level_path(assigns(:glucode_level))
  end

  test "should show glucode_level" do
    get :show, id: @glucode_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @glucode_level
    assert_response :success
  end

  test "should update glucode_level" do
    patch :update, id: @glucode_level, glucode_level: {  }
    assert_redirected_to glucode_level_path(assigns(:glucode_level))
  end

  test "should destroy glucode_level" do
    assert_difference('GlucodeLevel.count', -1) do
      delete :destroy, id: @glucode_level
    end

    assert_redirected_to glucode_levels_path
  end
end
