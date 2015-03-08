require 'test_helper'

class ParentToTeacherNotificationsControllerTest < ActionController::TestCase
  setup do
    @parent_to_teacher_notification = parent_to_teacher_notifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parent_to_teacher_notifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parent_to_teacher_notification" do
    assert_difference('ParentToTeacherNotification.count') do
      post :create, parent_to_teacher_notification: { content: @parent_to_teacher_notification.content, importance: @parent_to_teacher_notification.importance, parent_id: @parent_to_teacher_notification.parent_id, show_until: @parent_to_teacher_notification.show_until, subject: @parent_to_teacher_notification.subject, teacher_id: @parent_to_teacher_notification.teacher_id }
    end

    assert_redirected_to parent_to_teacher_notification_path(assigns(:parent_to_teacher_notification))
  end

  test "should show parent_to_teacher_notification" do
    get :show, id: @parent_to_teacher_notification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parent_to_teacher_notification
    assert_response :success
  end

  test "should update parent_to_teacher_notification" do
    patch :update, id: @parent_to_teacher_notification, parent_to_teacher_notification: { content: @parent_to_teacher_notification.content, importance: @parent_to_teacher_notification.importance, parent_id: @parent_to_teacher_notification.parent_id, show_until: @parent_to_teacher_notification.show_until, subject: @parent_to_teacher_notification.subject, teacher_id: @parent_to_teacher_notification.teacher_id }
    assert_redirected_to parent_to_teacher_notification_path(assigns(:parent_to_teacher_notification))
  end

  test "should destroy parent_to_teacher_notification" do
    assert_difference('ParentToTeacherNotification.count', -1) do
      delete :destroy, id: @parent_to_teacher_notification
    end

    assert_redirected_to parent_to_teacher_notifications_path
  end
end
