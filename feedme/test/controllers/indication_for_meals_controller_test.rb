require 'test_helper'

class IndicationForMealsControllerTest < ActionController::TestCase
  setup do
    @indication_for_meal = indication_for_meals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indication_for_meals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create indication_for_meal" do
    assert_difference('IndicationForMeal.count') do
      post :create, indication_for_meal: { attendance_id: @indication_for_meal.attendance_id, component_id: @indication_for_meal.component_id }
    end

    assert_redirected_to indication_for_meal_path(assigns(:indication_for_meal))
  end

  test "should show indication_for_meal" do
    get :show, id: @indication_for_meal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @indication_for_meal
    assert_response :success
  end

  test "should update indication_for_meal" do
    patch :update, id: @indication_for_meal, indication_for_meal: { attendance_id: @indication_for_meal.attendance_id, component_id: @indication_for_meal.component_id }
    assert_redirected_to indication_for_meal_path(assigns(:indication_for_meal))
  end

  test "should destroy indication_for_meal" do
    assert_difference('IndicationForMeal.count', -1) do
      delete :destroy, id: @indication_for_meal
    end

    assert_redirected_to indication_for_meals_path
  end
end
