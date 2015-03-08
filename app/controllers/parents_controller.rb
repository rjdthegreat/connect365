class ParentsController < ApplicationController
  before_action :set_parent, only: [:show, :edit, :update, :destroy]

  # GET /parents
  # GET /parents.json
  def index
    @parents = Parent.all
  end

  # GET /parents/1
  # GET /parents/1.json
  def show
    @individual_notifications = TeacherToParentNotification.where(:parent_id => params[:id]).all
    @school_notifications = SchoolNotification.where(:school_id => @parent.student.classroom.school.id).all
    @classroom_notifications = ClassroomNotification.where(:classroom_id => @parent.student.classroom.id).all
    classroom_id = @parent.student.classroom.id
    @teacher_detail = Teacher.where(:classroom_id=> classroom_id).first
  end

  # GET /parents/new
  def new
    @parent = Parent.new
         @list_of_schools = []
     School.all.each do |school|
       a = []
       a << school.name + ", " + school.city
       a << school.id
       @list_of_schools << a
     end
    @all_classrooms = []
     Classroom.all.each do |classroom|
       a = []
        a << "#{classroom.standard}" + " "+ classroom.division
        a << classroom.id
       @all_classrooms << a
     end         
     @all_students = []
     Student.all.each do |student|
       a = []
        a << "#{student.classroom.standard}" + " "+ student.classroom.division
        a << student.classroom.id
       @all_classrooms << a
     end         
  end

  # GET /parents/1/edit
  def edit
  end

  # POST /parents
  # POST /parents.json
  def create
    @parent = Parent.new(parent_params)
    @parent.is_pending = true 
    respond_to do |format|
      if @parent.save
          u = User.new(:username => params[:username], :password => params[:password], :role => "Parent", :identifier=> @parent.id)
          u.save

        format.html { redirect_to @parent, notice: 'Parent was successfully created.' }
        format.json { render :show, status: :created, location: @parent }
      else
        format.html { render :new }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parents/1
  # PATCH/PUT /parents/1.json
  def update
    respond_to do |format|
      if @parent.update(parent_params)
        format.html { redirect_to @parent, notice: 'Parent was successfully updated.' }
        format.json { render :show, status: :ok, location: @parent }
      else
        format.html { render :edit }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
    @parent.destroy
    respond_to do |format|
      format.html { redirect_to parents_url, notice: 'Parent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_from_parent_to_teacher
    p = ParentToTeacherNotification.new(:parent_id => params[:parent_id] , :teacher_id => params[:teacher_id] , :subject => params[:subject] , :content => params[:content])
    p.save
    flash[:notice] = "Message sent to Teacher successfully"
    redirect_to parent_path(params[:parent_id]) and return
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_params
      params.require(:parent).permit(:student_id, :first_name, :last_name, :contact_number, :email_address, :is_pending, :username, :password)
    end
end
