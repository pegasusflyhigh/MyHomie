class ReservationSerializer < ActiveModel::Serializer
  attributes  :id, :code, :booked_by, :start_date, :end_date, :status, :currency, 
              :security_price, :payout_price, :total_price, 
              :adult_count, :infant_count, :guest_count, :children_count, :night_count


  def booked_by
    {
      name: self.object.guest.full_name,
      email: self.object.guest.email
    }
  end
end
