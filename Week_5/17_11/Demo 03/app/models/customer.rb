# frozen_string_literal: true

# Customer
class Customer < ApplicationRecord
  has_many :orders
  has_many :reviews
end
