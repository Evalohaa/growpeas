class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index arts artisanat cuisine langues musique sport]

  def index
    @courses = Course.all
    @markers = @courses.geocoded.map do |course|
      {
        lat: course.latitude,
        lng: course.longitude,
        info_window: render_to_string(partial: "info_window", locals: { course: course })
      }
    end
    if params[:query_word].present? && params[:query_date].present?
      courses_date = Course.date_search(params[:query_date])
      courses_d = courses_date.map { |course| course}
      courses_word = Course.global_search(params[:query_word])
      courses_w = courses_word.map { |course| course}
      @courses = courses_d.intersection(courses_w)
    elsif params[:query_word].present?
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
    @markers = @courses.geocoded.map do |course|
      {
        lat: course.latitude,
        lng: course.longitude,
        info_window: render_to_string(partial: "info_window", locals: { course: course })
      }
    end
  end

  def artisanat
    category = Category.where(name: "artisanat")
    activity = Activity.where(category: category)
    @courses = Course.where(activity: activity)
    @markers = @courses.geocoded.map do |course|
      {
        lat: course.latitude,
        lng: course.longitude,
        info_window: render_to_string(partial: "info_window", locals: { course: course })
      }
    end
  end

  def cuisine
    category = Category.where(name: "cuisine")
    activity = Activity.where(category: category)
    @courses = Course.where(activity: activity)
    @markers = @courses.geocoded.map do |course|
      {
        lat: course.latitude,
        lng: course.longitude,
        info_window: render_to_string(partial: "info_window", locals: { course: course })
      }
    end
  end

  def sport
    category = Category.where(name: "sport")
    activity = Activity.where(category: category)
    @courses = Course.where(activity: activity)
    @markers = @courses.geocoded.map do |course|
      {
        lat: course.latitude,
        lng: course.longitude,
        info_window: render_to_string(partial: "info_window", locals: { course: course })
      }
    end
  end

  def musique
    category = Category.where(name: "musique")
    activity = Activity.where(category: category)
    @courses = Course.where(activity: activity)
    @markers = @courses.geocoded.map do |course|
      {
        lat: course.latitude,
        lng: course.longitude,
        info_window: render_to_string(partial: "info_window", locals: { course: course })
      }
    end
  end

  def langues
    category = Category.where(name: "langues")
    activity = Activity.where(category: category)
    @courses = Course.where(activity: activity)
    @markers = @courses.geocoded.map do |course|
      {
        lat: course.latitude,
        lng: course.longitude,
        info_window: render_to_string(partial: "info_window", locals: { course: course })
      }
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :duration, :starting_time, :date, :description, :price, :address, :user_id,
      :activity_id, :max_of_attendees, :photo, :attendee_count, :cat)
  end

end
