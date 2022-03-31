class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index arts artisanat cuisine langues musique sport]

  def index
    if params[:query_word].present?
      @courses = Course.global_search(params[:query_word])
    elsif params[:query_date].present?
      @courses = Course.date_search(params[:query_date])
    else
      @courses = Course.all
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    if @course.save
      redirect_to course_path(@course), notice: "Course was created!"
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
    redirect_to course_path(@course)
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end

  def arts
    category = Category.where(name: "arts")
    activity = Activity.where(category: category)
    @courses = Course.where(activity: activity)
  end

  def artisanat
    category = Category.where(name: "artisanat")
    activity = Activity.where(category: category)
    @courses = Course.where(activity: activity)
  end

  def cuisine
    category = Category.where(name: "cuisine")
    activity = Activity.where(category: category)
    @courses = Course.where(activity: activity)
  end

  def sport
    category = Category.where(name: "sport")
    activity = Activity.where(category: category)
    @courses = Course.where(activity: activity)
  end

  def musique
    category = Category.where(name: "musique")
    activity = Activity.where(category: category)
    @courses = Course.where(activity: activity)
  end

  def langues
    category = Category.where(name: "langues")
    activity = Activity.where(category: category)
    @courses = Course.where(activity: activity)
  end

  private

  def course_params
    params.require(:course).permit(:name, :duration, :starting_time, :date, :description, :price, :address, :user_id,
      :activity_id, :max_of_attendees, :photo, :attendee_count)
  end

  def convert(element)
    element.map {|e| e.searchable}
  end

end
