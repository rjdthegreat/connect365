class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def logout
    session.clear
    redirect_to login_path and return
  end
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def root
    if session[:role].present?
      if session[:role] == "School"
         redirect_to school_path(session[:school_id]) and return
      elsif session[:role] == "Teacher"
         redirect_to school_path(session[:teacher_id]) and return
       elsif session[:role] == "Parent"
         redirect_to school_path(session[:parent_id]) and return
      end
    else
      redirect_to login_path and return
    end
  end
    
  def login
    @user = User.new
  end

  def validate_login
    puts "in validate, params ="
    puts params
    user = User.where(:username => params[:username]).first
    if user.blank?
      flash[:notice] = "Username Doesnt exist"
      render "login" and return
    end
    if user.password != params[:password]
      flash[:notice] = "Incorrect Password"
      render "login" and return
    else
      role = user.role
      session[:role] = role
      flash[:notice] = "Welcome " + user.username + "!"
      if role == "School"
        session[:school_id] = user.identifier
        school = School.find(user.identifier)
        redirect_to school_path(school) and return
      elsif role == "Teacher"
        session[:teacher_id] = user.identifier
        redirect_to teacher_path(user.identifier) and return
      elsif role == "Parent"
        session[:parent_id] = user.identifier
        redirect_to parent_path(user.identifier) and return
      else
        flash[:notice] = "Invalid Role"
        render "login" and return
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:username, :password, :role, :identifier)
  end
end
