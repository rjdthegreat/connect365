require 'test_helper'

class SchoolNotificationsControllerTest < ActionController::TestCase
  setup do
    @school_notification = school_notifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_notifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_notification" do
    assert_difference('SchoolNotification.count') do
      post :create, school_notification: { content: @school_notification.content, importance: @school_notification.importance, school_id: @school_notification.school_id, show_until: @school_notification.show_until, subject: @school_notification.subject }
    end

    assert_redirected_to school_notification_path(assigns(:school_notification))
  end

  test "should show school_notification" do
    get :show, id: @school_notification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @school_notification
    assert_response :success
  end

  test "should update school_notification" do
    patch :update, id: @school_notification, school_notification: { content: @school_notification.content, importance: @school_notification.importance, school_id: @school_notification.school_id, show_until: @school_notification.show_until, subject: @school_notification.subject }
    assert_redirected_to school_notification_path(assigns(:school_notification))
  end

  test "should destroy school_notification" do
    assert_difference('SchoolNotification.count', -1) do
      delete :destroy, id: @school_notification
    end

    assert_redirected_to school_notifications_path
  end
end
