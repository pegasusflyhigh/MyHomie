# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reservation, type: :model do

	let(:guest) {FactoryBot.create(:guest)}
	let(:reservation) { FactoryBot.create(:reservation, guest_id: guest.id)}

	subject { reservation }
	
	describe 'validations' do
		it { should validate_presence_of(:guest_count) }
		it { should validate_uniqueness_of(:code) }
	end
end
