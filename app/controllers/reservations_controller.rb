class ReservationsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    # if @course.date > Time.now
      @reservation = Reservation.new
    # else
      # redirect_to course_path(@course)
    # end
  end

  def create
    @reservation = Reservation.new(params_reservation)
    @course = Course.find(params[:course_id])
    @reservation.course = @course
    @reservation.user = current_user
    if @reservation.save
      attendee_count = @course.attendee_count
      attendee_count += 1
      @course.update(attendee_count: attendee_count)
      redirect_to user_path(current_user)
    else
      redirect_to new_course_reservation_path(@course)
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(params_reservation)
    redirect_to user_path(current_user)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to user_path(current_user)
  end

  private

  def params_reservation
    params.require(:reservation).permit(:details, :user_id, :course_id)
  end
end
