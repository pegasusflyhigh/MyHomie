# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :guest

  validates_uniqueness_of :code
  validates_presence_of :guest_count

  ATTRIBUTE_ALIASES = {
    code: [:reservation_code],
    night_count: [:nights],
    guest_count: [:guests, :number_of_guests],
    adult_count: [:number_of_adults, :adults],
    children_count: [:children, :number_of_children],
    infant_count: [:infants, :number_of_infants],
    status: [:status_type],
    currency: [:host_currency],
    payout_price: [:expected_payout_amount],
    security_price: [:listing_security_price_accurate],
    total_price: [:total_paid_amount_accurate],
    guest: [],
    extra_keys: [:guest_details],
    start_date: [],
    end_date: []
  }.freeze

  def self.rest_attributes
    ATTRIBUTE_ALIASES.to_a.flatten + Guest::ATTRIBUTE_ALIASES.to_a.flatten
  end
end
