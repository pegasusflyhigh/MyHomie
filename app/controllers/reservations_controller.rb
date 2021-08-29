class ReservationsController < ApplicationController
  wrap_parameters :reservation, include: Reservation.rest_attributes

  def create
    parsed_params = ::ReservationPayloadParser.new(reservation_params).call
    reservation = Reservation.new(parsed_params.except(:guest))
    reservation.guest_id = Guest.where(email: parsed_params.dig(:guest, :email)).first&.id
    reservation.build_guest(parsed_params[:guest]) if reservation.guest_id.blank?

    if reservation.save
      render json: reservation, status: :ok
    else
      render json: { message: reservation.errors.full_messages }, status: :bad_request
    end
  end

  def index
    render json: Reservation.all
  end

  private

  def reservation_params
    params[:reservation].as_json
  end
end
