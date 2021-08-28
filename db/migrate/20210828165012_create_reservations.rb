# frozen_string_literal: true

class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :code
      t.date :start_date
      t.date :end_date
      t.string :status
      t.string :currency
      t.integer :security_price
      t.integer :adult_count
      t.integer :infant_count
      t.integer :children_count
      t.integer :guest_count
      t.integer :night_count
      t.integer :total_price
      t.integer :payout_price
      t.references :guest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
