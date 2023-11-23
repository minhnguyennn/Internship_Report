# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.integer :house_number
      t.string :society_name
      t.string :area
      t.string :city

      t.timestamps
    end
  end
end
