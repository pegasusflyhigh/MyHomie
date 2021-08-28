# frozen_string_literal: true

class CreateGuests < ActiveRecord::Migration[6.1]
  def change
    create_table :guests do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.text :phone_numbers

      t.timestamps
    end
  end
end
