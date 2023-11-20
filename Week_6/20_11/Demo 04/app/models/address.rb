# frozen_string_literal: true

# Address
class Address < ApplicationRecord
  belongs_to :client, inverse_of: :address

  validates :street, presence: true
  validates :city, presence: true
  validates :zipcode, presence: true
end
