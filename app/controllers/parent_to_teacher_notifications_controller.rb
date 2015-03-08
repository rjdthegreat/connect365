class ParentToTeacherNotificationsController < ApplicationController
  before_action :set_parent_to_teacher_notification, only: [:show, :edit, :update, :destroy]

  # GET /parent_to_teacher_notifications
  # GET /parent_to_teacher_notifications.json
  def index
    @parent_to_teacher_notifications = ParentToTeacherNotification.all
  end

  # GET /parent_to_teacher_notifications/1
  # GET /parent_to_teacher_notifications/1.json
  def show
  end

  # GET /parent_to_teacher_notifications/new
  def new
    @parent_to_teacher_notification = ParentToTeacherNotification.new
  end

  # GET /parent_to_teacher_notifications/1/edit
  def edit
  end

  # POST /parent_to_teacher_notifications
  # POST /parent_to_teacher_notifications.json
  def create
    @parent_to_teacher_notification = ParentToTeacherNotification.new(parent_to_teacher_notification_params)

    respond_to do |format|
      if @parent_to_teacher_notification.save
        format.html { redirect_to @parent_to_teacher_notification, notice: 'Parent to teacher notification was successfully created.' }
        format.json { render :show, status: :created, location: @parent_to_teacher_notification }
      else
        format.html { render :new }
        format.json { render json: @parent_to_teacher_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parent_to_teacher_notifications/1
  # PATCH/PUT /parent_to_teacher_notifications/1.json
  def update
    respond_to do |format|
      if @parent_to_teacher_notification.update(parent_to_teacher_notification_params)
        format.html { redirect_to @parent_to_teacher_notification, notice: 'Parent to teacher notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @parent_to_teacher_notification }
      else
        format.html { render :edit }
        format.json { render json: @parent_to_teacher_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parent_to_teacher_notifications/1
  # DELETE /parent_to_teacher_notifications/1.json
  def destroy
    @parent_to_teacher_notification.destroy
    respond_to do |format|
      format.html { redirect_to parent_to_teacher_notifications_url, notice: 'Parent to teacher notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent_to_teacher_notification
      @parent_to_teacher_notification = ParentToTeacherNotification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_to_teacher_notification_params
      params.require(:parent_to_teacher_notification).permit(:parent_id, :teacher_id, :importance, :subject, :content, :show_until)
    end
end
