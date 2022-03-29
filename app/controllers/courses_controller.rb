class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to course_path(@course), notice: "Course was created!"
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def course_params
    params.require(:course).permit(:name, :duration, :starting_time, :date, :description, :price, :address, :user_id, :activity_id, :max_of_attendees)
  end

end
