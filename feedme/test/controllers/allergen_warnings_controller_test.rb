require 'test_helper'

class AllergenWarningsControllerTest < ActionController::TestCase
  setup do
    @allergen_warning = allergen_warnings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:allergen_warnings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create allergen_warning" do
    assert_difference('AllergenWarning.count') do
      post :create, allergen_warning: { warning_content: @allergen_warning.warning_content }
    end

    assert_redirected_to allergen_warning_path(assigns(:allergen_warning))
  end

  test "should show allergen_warning" do
    get :show, id: @allergen_warning
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @allergen_warning
    assert_response :success
  end

  test "should update allergen_warning" do
    patch :update, id: @allergen_warning, allergen_warning: { warning_content: @allergen_warning.warning_content }
    assert_redirected_to allergen_warning_path(assigns(:allergen_warning))
  end

  test "should destroy allergen_warning" do
    assert_difference('AllergenWarning.count', -1) do
      delete :destroy, id: @allergen_warning
    end

    assert_redirected_to allergen_warnings_path
  end
end
