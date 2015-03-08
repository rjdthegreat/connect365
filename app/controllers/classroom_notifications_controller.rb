class ClassroomNotificationsController < ApplicationController
  before_action :set_classroom_notification, only: [:show, :edit, :update, :destroy]

  # GET /classroom_notifications
  # GET /classroom_notifications.json
  def index
    @classroom_notifications = ClassroomNotification.all
  end

  # GET /classroom_notifications/1
  # GET /classroom_notifications/1.json
  def show
  end

  # GET /classroom_notifications/new
  def new
    @classroom_notification = ClassroomNotification.new
  end

  # GET /classroom_notifications/1/edit
  def edit
  end

  # POST /classroom_notifications
  # POST /classroom_notifications.json
  def create
    @classroom_notification = ClassroomNotification.new(classroom_notification_params)

    respond_to do |format|
      if @classroom_notification.save
        format.html { redirect_to @classroom_notification, notice: 'Classroom notification was successfully created.' }
        format.json { render :show, status: :created, location: @classroom_notification }
      else
        format.html { render :new }
        format.json { render json: @classroom_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classroom_notifications/1
  # PATCH/PUT /classroom_notifications/1.json
  def update
    respond_to do |format|
      if @classroom_notification.update(classroom_notification_params)
        format.html { redirect_to @classroom_notification, notice: 'Classroom notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @classroom_notification }
      else
        format.html { render :edit }
        format.json { render json: @classroom_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classroom_notifications/1
  # DELETE /classroom_notifications/1.json
  def destroy
    @classroom_notification.destroy
    respond_to do |format|
      format.html { redirect_to classroom_notifications_url, notice: 'Classroom notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom_notification
      @classroom_notification = ClassroomNotification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classroom_notification_params
      params.require(:classroom_notification).permit(:classroom_id, :importance, :subject, :content, :show_until)
    end
end
