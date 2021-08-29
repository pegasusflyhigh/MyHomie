require 'rails_helper'

RSpec.describe "Reservations", type: :request do
  let(:payload1) do
    JSON.parse(
      File.read(
        Rails.root.join('spec', 'fixtures', 'payload1.json')
      )
    ).with_indifferent_access
  end

  describe "POST /create" do
    context 'with valid attributes' do      
      it 'creates a new record' do
        expect { post "/reservations", :params => payload1 }.to change { Reservation.count }.by(1)
      end
    end

    context 'with invalid attributes' do
      before do
        guest = FactoryBot.create(:guest)
        FactoryBot.create(:reservation, code: 'BOND007', guest_id: guest.id)
      end
      
      it 'returns error' do
        post "/reservations", :params => payload1
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
