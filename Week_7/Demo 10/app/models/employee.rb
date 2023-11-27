# frozen_string_literal: true

class Employee < ApplicationRecord
  def self.ransackable_attributes(_auth_object = nil)
    %w[employee_name]
  end

  has_many :addresses
  accepts_nested_attributes_for :addresses,
                                allow_destroy: true,
                                reject_if: proc { |att|
                                             att['house_number'].blank? || att['society_name'].blank? || att['city'].blank? || att['area'].blank?
                                           }
end
