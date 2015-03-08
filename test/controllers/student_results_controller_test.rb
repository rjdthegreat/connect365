require 'test_helper'

class StudentResultsControllerTest < ActionController::TestCase
  setup do
    @student_result = student_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_result" do
    assert_difference('StudentResult.count') do
      post :create, student_result: { comments: @student_result.comments, exam_id: @student_result.exam_id, grade: @student_result.grade, student_id: @student_result.student_id }
    end

    assert_redirected_to student_result_path(assigns(:student_result))
  end

  test "should show student_result" do
    get :show, id: @student_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_result
    assert_response :success
  end

  test "should update student_result" do
    patch :update, id: @student_result, student_result: { comments: @student_result.comments, exam_id: @student_result.exam_id, grade: @student_result.grade, student_id: @student_result.student_id }
    assert_redirected_to student_result_path(assigns(:student_result))
  end

  test "should destroy student_result" do
    assert_difference('StudentResult.count', -1) do
      delete :destroy, id: @student_result
    end

    assert_redirected_to student_results_path
  end
end
