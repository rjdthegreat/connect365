class SchoolNotificationsController < ApplicationController
  before_action :set_school_notification, only: [:show, :edit, :update, :destroy]

  # GET /school_notifications
  # GET /school_notifications.json
  def index
    @school_notifications = SchoolNotification.all
  end

  # GET /school_notifications/1
  # GET /school_notifications/1.json
  def show
  end

  # GET /school_notifications/new
  def new
    @school_notification = SchoolNotification.new
  end

  # GET /school_notifications/1/edit
  def edit
  end

  # POST /school_notifications
  # POST /school_notifications.json
  def create
    @school_notification = SchoolNotification.new(school_notification_params)

    respond_to do |format|
      if @school_notification.save
        format.html { redirect_to @school_notification, notice: 'School notification was successfully created.' }
        format.json { render :show, status: :created, location: @school_notification }
      else
        format.html { render :new }
        format.json { render json: @school_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_notifications/1
  # PATCH/PUT /school_notifications/1.json
  def update
    respond_to do |format|
      if @school_notification.update(school_notification_params)
        format.html { redirect_to @school_notification, notice: 'School notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_notification }
      else
        format.html { render :edit }
        format.json { render json: @school_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_notifications/1
  # DELETE /school_notifications/1.json
  def destroy
    @school_notification.destroy
    respond_to do |format|
      format.html { redirect_to school_path(session[:school_id]), notice: 'School notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_notification
      @school_notification = SchoolNotification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_notification_params
      params.require(:school_notification).permit(:school_id, :importance, :subject, :content, :show_until)
    end
end