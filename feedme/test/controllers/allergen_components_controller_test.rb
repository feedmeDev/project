require 'test_helper'

class AllergenComponentsControllerTest < ActionController::TestCase
  setup do
    @allergen_component = allergen_components(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:allergen_components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create allergen_component" do
    assert_difference('AllergenComponent.count') do
      post :create, allergen_component: { allergen_warning_id: @allergen_component.allergen_warning_id, component_id: @allergen_component.component_id }
    end

    assert_redirected_to allergen_component_path(assigns(:allergen_component))
  end

  test "should show allergen_component" do
    get :show, id: @allergen_component
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @allergen_component
    assert_response :success
  end

  test "should update allergen_component" do
    patch :update, id: @allergen_component, allergen_component: { allergen_warning_id: @allergen_component.allergen_warning_id, component_id: @allergen_component.component_id }
    assert_redirected_to allergen_component_path(assigns(:allergen_component))
  end

  test "should destroy allergen_component" do
    assert_difference('AllergenComponent.count', -1) do
      delete :destroy, id: @allergen_component
    end

    assert_redirected_to allergen_components_path
  end
end
