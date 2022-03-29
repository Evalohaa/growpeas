class ReservationsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @course = Course.find(params[:course_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(params_reservation)
    @user = User.find(params[:user_id])
    @course = Course.find(params[:course_id])
    @reservation.user = @user
    @reservation.course = @course
    if @reservation.save
      redirect_to user_path(@user)
    else
      redirect_to new_course_reservation_path
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservatio.destroy
    redirect_to user_path(@review.restaurant)
  end

  private

  def params_reservation
    params.require(:reservation).permit(:user_id, :course_id)
  end
end
