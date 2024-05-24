class CourseModulesController < ApplicationController
  before_action :set_course_module, only: %i[show edit update destroy]

  # GET /course_modules or /course_modules.json
  def index
    @course_modules = CourseModule.all
  end

  # GET /course_modules/1 or /course_modules/1.json
  def show
  end

  # GET /course_modules/new
  def new
    @course_module = CourseModule.new
  end

  # GET /course_modules/1/edit
  def edit
  end

  def enroll_to_course_module
    course_module = CourseModule.find(params[:course_module_id])
    course_module.enroll(current_user)
    redirect_to course_modules_path, notice: "User correctly enrolled"
  end
  # POST /course_modules or /course_modules.json

  # PATCH/PUT /course_modules/1 or /course_modules/1.json
  def update
    respond_to do |format|
      if @course_module.update(course_module_params)
        format.html { redirect_to course_module_url(@course_module), notice: "Course module was successfully updated." }
        format.json { render :show, status: :ok, location: @course_module }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_modules/1 or /course_modules/1.json
  def destroy
    @course_module.destroy!

    respond_to do |format|
      format.html { redirect_to course_modules_url, notice: "Course module was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course_module
    @course_module = CourseModule.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_module_params
    params.require(:course_module).permit(:title)
  end
end
