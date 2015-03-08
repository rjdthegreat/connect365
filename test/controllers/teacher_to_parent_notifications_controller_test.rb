require 'test_helper'

class TeacherToParentNotificationsControllerTest < ActionController::TestCase
  setup do
    @teacher_to_parent_notification = teacher_to_parent_notifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teacher_to_parent_notifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher_to_parent_notification" do
    assert_difference('TeacherToParentNotification.count') do
      post :create, teacher_to_parent_notification: { content: @teacher_to_parent_notification.content, importance: @teacher_to_parent_notification.importance, parent_id: @teacher_to_parent_notification.parent_id, show_until: @teacher_to_parent_notification.show_until, subject: @teacher_to_parent_notification.subject, teacher_id: @teacher_to_parent_notification.teacher_id }
    end

    assert_redirected_to teacher_to_parent_notification_path(assigns(:teacher_to_parent_notification))
  end

  test "should show teacher_to_parent_notification" do
    get :show, id: @teacher_to_parent_notification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher_to_parent_notification
    assert_response :success
  end

  test "should update teacher_to_parent_notification" do
    patch :update, id: @teacher_to_parent_notification, teacher_to_parent_notification: { content: @teacher_to_parent_notification.content, importance: @teacher_to_parent_notification.importance, parent_id: @teacher_to_parent_notification.parent_id, show_until: @teacher_to_parent_notification.show_until, subject: @teacher_to_parent_notification.subject, teacher_id: @teacher_to_parent_notification.teacher_id }
    assert_redirected_to teacher_to_parent_notification_path(assigns(:teacher_to_parent_notification))
  end

  test "should destroy teacher_to_parent_notification" do
    assert_difference('TeacherToParentNotification.count', -1) do
      delete :destroy, id: @teacher_to_parent_notification
    end

    assert_redirected_to teacher_to_parent_notifications_path
  end
end
