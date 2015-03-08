require 'test_helper'

class ClassroomNotificationsControllerTest < ActionController::TestCase
  setup do
    @classroom_notification = classroom_notifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classroom_notifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classroom_notification" do
    assert_difference('ClassroomNotification.count') do
      post :create, classroom_notification: { classroom_id: @classroom_notification.classroom_id, content: @classroom_notification.content, importance: @classroom_notification.importance, show_until: @classroom_notification.show_until, subject: @classroom_notification.subject }
    end

    assert_redirected_to classroom_notification_path(assigns(:classroom_notification))
  end

  test "should show classroom_notification" do
    get :show, id: @classroom_notification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @classroom_notification
    assert_response :success
  end

  test "should update classroom_notification" do
    patch :update, id: @classroom_notification, classroom_notification: { classroom_id: @classroom_notification.classroom_id, content: @classroom_notification.content, importance: @classroom_notification.importance, show_until: @classroom_notification.show_until, subject: @classroom_notification.subject }
    assert_redirected_to classroom_notification_path(assigns(:classroom_notification))
  end

  test "should destroy classroom_notification" do
    assert_difference('ClassroomNotification.count', -1) do
      delete :destroy, id: @classroom_notification
    end

    assert_redirected_to classroom_notifications_path
  end
end
