class ReservationsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(params_reservation)
    @course = Course.find(params[:course_id])
    @reservation.course = @course
    @reservation.user = current_user
    if @reservation.save
      redirect_to user_path(current_user)
    else
      redirect_to new_course_reservation_path(@course)
    end
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
