require 'test_helper'

class ComponentsMealsControllerTest < ActionController::TestCase
  setup do
    @components_meal = components_meals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_meals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_meal" do
    assert_difference('ComponentsMeal.count') do
      post :create, components_meal: { component: @components_meal.component, meal: @components_meal.meal }
    end

    assert_redirected_to components_meal_path(assigns(:components_meal))
  end

  test "should show components_meal" do
    get :show, id: @components_meal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @components_meal
    assert_response :success
  end

  test "should update components_meal" do
    patch :update, id: @components_meal, components_meal: { component: @components_meal.component, meal: @components_meal.meal }
    assert_redirected_to components_meal_path(assigns(:components_meal))
  end

  test "should destroy components_meal" do
    assert_difference('ComponentsMeal.count', -1) do
      delete :destroy, id: @components_meal
    end

    assert_redirected_to components_meals_path
  end
end
