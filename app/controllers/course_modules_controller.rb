class CourseModulesController < ApplicationController
  before_action :set_course_module, only: %i[show]

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

  def enroll_to_course_module
    course_module = CourseModule.find(params[:course_module_id])
    course_module.enroll(current_user)
    redirect_to course_modules_path, notice: "User correctly enrolled"
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
