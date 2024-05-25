class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[show]

  # GET /lessons or /lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1 or /lessons/1.json
  def show
  end

  def complete_lesson
    lesson = Lesson.find(params[:lesson_id])
    lesson.complete(current_user)
    redirect_to lesson_path(lesson), notice: "Lesson completed"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lesson_params
    params.require(:lesson).permit(:content, :course_module_id)
  end
end
