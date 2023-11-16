# frozen_string_literal: true

class Patient < ApplicationRecord
  has_many :appointments
  has_many :physicians, through: :appointments
end
