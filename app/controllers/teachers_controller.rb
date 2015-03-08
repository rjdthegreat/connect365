class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
    all_students_ids = Student.where(:classroom_id => @teacher.classroom.id).all.pluck(:id)
    @individual_notifications = ParentToTeacherNotification.where(:teacher_id => params[:id]).all
    @school_notifications = SchoolNotification.where(:school_id => @teacher.classroom.school.id).all
    @classroom_notification = ClassroomNotification.where(:classroom_id => @teacher.classroom.id).all
    @pending_parents = Parent.where(:student_id => all_students_ids).where(:is_pending => true).all
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
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
     
  end

  # GET /teachers/1/edit
  def edit
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
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.is_pending = true 
    respond_to do |format|
      if @teacher.save
        u = User.new(:username => params[:username], :password => params[:password], :role => "Teacher", :identifier=> @teacher.id)
        u.save
        
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def students
    puts "Params in students======"
    teacher_id = params[:id]
    teacher = Teacher.find(teacher_id)
    students = Student.where(:classroom_id => teacher.classroom.id).all
    puts "studentsssss="
    puts students
    @parents=Parent.where(:student_id => students.pluck(:id)).all
    session[:teacher_id] = teacher_id
  end
  
  def parent
    puts "Params =="
    puts params
    @parent = Parent.find(params[:parent_id])
    @teacher = Teacher.find(params[:teacher_id])
  end
  
  def send_from_teacher_to_parent
    p = TeacherToParentNotification.new(:parent_id => params[:parent_id] , :teacher_id => params[:teacher_id] , :subject => params[:subject] , :content => params[:content])
    p.save
    redirect_to teacher_path(params[:teacher_id]) and return
  end
  
  def add_classroom_notification
    n = ClassroomNotification.new(:classroom_id => params[:classroom_id] , :subject => params[:subject] , :content => params[:content])
    n.save
    flash[:notice] = "New Classroom Notification added!"
    redirect_to teacher_path(params[:teacher_id]) and return
  end
  
  def approve
    n = Teacher.find(params[:id])
    n.is_pending = false;
    n.save
    flash[:notice] = "Teacher successfully Approved"
    redirect_to school_path(session[:school_id])
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:classroom_id, :first_name, :last_name, :contact_number, :email_address, :is_pending, :username, :password)
    end
end
