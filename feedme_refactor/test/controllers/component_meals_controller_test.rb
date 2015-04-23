require 'test_helper'

class ComponentMealsControllerTest < ActionController::TestCase
  setup do
    @component_meal = component_meals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:component_meals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create component_meal" do
    assert_difference('ComponentMeal.count') do
      post :create, component_meal: { component_id: @component_meal.component_id, meal_id: @component_meal.meal_id }
    end

    assert_redirected_to component_meal_path(assigns(:component_meal))
  end

  test "should show component_meal" do
    get :show, id: @component_meal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @component_meal
    assert_response :success
  end

  test "should update component_meal" do
    patch :update, id: @component_meal, component_meal: { component_id: @component_meal.component_id, meal_id: @component_meal.meal_id }
    assert_redirected_to component_meal_path(assigns(:component_meal))
  end

  test "should destroy component_meal" do
    assert_difference('ComponentMeal.count', -1) do
      delete :destroy, id: @component_meal
    end

    assert_redirected_to component_meals_path
  end
end
