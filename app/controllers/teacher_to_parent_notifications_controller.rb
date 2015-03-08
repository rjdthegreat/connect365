class TeacherToParentNotificationsController < ApplicationController
  before_action :set_teacher_to_parent_notification, only: [:show, :edit, :update, :destroy]

  # GET /teacher_to_parent_notifications
  # GET /teacher_to_parent_notifications.json
  def index
    @teacher_to_parent_notifications = TeacherToParentNotification.all
  end

  # GET /teacher_to_parent_notifications/1
  # GET /teacher_to_parent_notifications/1.json
  def show
  end

  # GET /teacher_to_parent_notifications/new
  def new
    @teacher_to_parent_notification = TeacherToParentNotification.new
  end

  # GET /teacher_to_parent_notifications/1/edit
  def edit
  end

  # POST /teacher_to_parent_notifications
  # POST /teacher_to_parent_notifications.json
  def create
    @teacher_to_parent_notification = TeacherToParentNotification.new(teacher_to_parent_notification_params)

    respond_to do |format|
      if @teacher_to_parent_notification.save
        format.html { redirect_to @teacher_to_parent_notification, notice: 'Teacher to parent notification was successfully created.' }
        format.json { render :show, status: :created, location: @teacher_to_parent_notification }
      else
        format.html { render :new }
        format.json { render json: @teacher_to_parent_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teacher_to_parent_notifications/1
  # PATCH/PUT /teacher_to_parent_notifications/1.json
  def update
    respond_to do |format|
      if @teacher_to_parent_notification.update(teacher_to_parent_notification_params)
        format.html { redirect_to @teacher_to_parent_notification, notice: 'Teacher to parent notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher_to_parent_notification }
      else
        format.html { render :edit }
        format.json { render json: @teacher_to_parent_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_to_parent_notifications/1
  # DELETE /teacher_to_parent_notifications/1.json
  def destroy
    @teacher_to_parent_notification.destroy
    respond_to do |format|
      format.html { redirect_to teacher_to_parent_notifications_url, notice: 'Teacher to parent notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_to_parent_notification
      @teacher_to_parent_notification = TeacherToParentNotification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_to_parent_notification_params
      params.require(:teacher_to_parent_notification).permit(:teacher_id, :parent_id, :importance, :subject, :content, :show_until)
    end
end
