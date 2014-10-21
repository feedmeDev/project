require 'test_helper'

class FeedbackForMealsControllerTest < ActionController::TestCase
  setup do
    @feedback_for_meal = feedback_for_meals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feedback_for_meals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedback_for_meal" do
    assert_difference('FeedbackForMeal.count') do
      post :create, feedback_for_meal: { body: @feedback_for_meal.body, date_of_meal: @feedback_for_meal.date_of_meal, meal_id: @feedback_for_meal.meal_id, person_id: @feedback_for_meal.person_id }
    end

    assert_redirected_to feedback_for_meal_path(assigns(:feedback_for_meal))
  end

  test "should show feedback_for_meal" do
    get :show, id: @feedback_for_meal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feedback_for_meal
    assert_response :success
  end

  test "should update feedback_for_meal" do
    patch :update, id: @feedback_for_meal, feedback_for_meal: { body: @feedback_for_meal.body, date_of_meal: @feedback_for_meal.date_of_meal, meal_id: @feedback_for_meal.meal_id, person_id: @feedback_for_meal.person_id }
    assert_redirected_to feedback_for_meal_path(assigns(:feedback_for_meal))
  end

  test "should destroy feedback_for_meal" do
    assert_difference('FeedbackForMeal.count', -1) do
      delete :destroy, id: @feedback_for_meal
    end

    assert_redirected_to feedback_for_meals_path
  end
end
