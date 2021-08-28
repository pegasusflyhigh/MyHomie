# frozen_string_literal: true

class Guest < ApplicationRecord
  has_many :reservations

  validates_uniqueness_of :email

  def full_name
    first_name.to_s + ' ' + last_name.to_s
  end
end
