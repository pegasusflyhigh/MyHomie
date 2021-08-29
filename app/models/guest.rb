# frozen_string_literal: true

class Guest < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates_uniqueness_of :email

  ATTRIBUTE_ALIASES = {
    first_name: [:guest_first_name],
    last_name: [:guest_last_name],
    email: [:guest_email],
    phone_numbers: [:phone, :guest_phone_numbers],
  }.freeze

  def full_name
    first_name.to_s + ' ' + last_name.to_s
  end
end
