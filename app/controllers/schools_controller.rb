class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
    @notifications = SchoolNotification.where(:school_id => params[:id]).all
    @classrooms = Classroom.where(:school_id => params[:id]).all
    @pending_teachers = Teacher.where(:classroom_id => @classrooms.pluck(:id)).where(:is_pending => true).all
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  # POST /schools.json
  def create
    puts "school_params"
    puts school_params
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        u = User.new(:username => params[:username], :password => params[:password], :role => "School", :identifier=> @school.id)
        u.save
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.jsontEST Test Notification 
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, notice: 'School was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve
    n = Teacher.find(params[:id])
    n.is_pending = false;
    n.save
    redirect_to schools_path
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, :city, :address, :contact_number, :email_address, :is_pending, :username, :password)
    end
end
