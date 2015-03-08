class StudentResultsController < ApplicationController
  before_action :set_student_result, only: [:show, :edit, :update, :destroy]

  # GET /student_results
  # GET /student_results.json
  def index
    @student_results = StudentResult.all
  end

  # GET /student_results/1
  # GET /student_results/1.json
  def show
  end

  # GET /student_results/new
  def new
    @student_result = StudentResult.new
  end

  # GET /student_results/1/edit
  def edit
  end

  # POST /student_results
  # POST /student_results.json
  def create
    @student_result = StudentResult.new(student_result_params)

    respond_to do |format|
      if @student_result.save
        format.html { redirect_to @student_result, notice: 'Student result was successfully created.' }
        format.json { render :show, status: :created, location: @student_result }
      else
        format.html { render :new }
        format.json { render json: @student_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_results/1
  # PATCH/PUT /student_results/1.json
  def update
    respond_to do |format|
      if @student_result.update(student_result_params)
        format.html { redirect_to @student_result, notice: 'Student result was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_result }
      else
        format.html { render :edit }
        format.json { render json: @student_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_results/1
  # DELETE /student_results/1.json
  def destroy
    @student_result.destroy
    respond_to do |format|
      format.html { redirect_to student_results_url, notice: 'Student result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_result
      @student_result = StudentResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_result_params
      params.require(:student_result).permit(:exam_id, :student_id, :grade, :comments)
    end
end
