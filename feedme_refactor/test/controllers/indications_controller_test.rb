require 'test_helper'

class IndicationsControllerTest < ActionController::TestCase
  setup do
    @indication = indications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create indication" do
    assert_difference('Indication.count') do
      post :create, indication: { attendance_id: @indication.attendance_id, component_id: @indication.component_id }
    end

    assert_redirected_to indication_path(assigns(:indication))
  end

  test "should show indication" do
    get :show, id: @indication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @indication
    assert_response :success
  end

  test "should update indication" do
    patch :update, id: @indication, indication: { attendance_id: @indication.attendance_id, component_id: @indication.component_id }
    assert_redirected_to indication_path(assigns(:indication))
  end

  test "should destroy indication" do
    assert_difference('Indication.count', -1) do
      delete :destroy, id: @indication
    end

    assert_redirected_to indications_path
  end
end
