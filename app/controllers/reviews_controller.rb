class ReviewsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @review = Review.new
  end

  def create
    @course = Course.find(params[:course_id])
    @review = Review.new(params_review)
    @review.course = @course
    if @review.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(params_review)
    redirect_to course_path(@review.course)
  end

  def destroy
    @review = Review.find(params[:course_id])
    @review.destroy
    redirect_to course_path(@course)
  end

  private

  def params_review
    params.require(:review).permit(:rating, :content)
  end
end
