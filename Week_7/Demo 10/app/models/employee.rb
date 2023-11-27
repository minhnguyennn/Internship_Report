# frozen_string_literal: true

class Employee < ApplicationRecord

  ransacker :start_date, type: :date do
    Arel.sql('starts_at::date')
  end

  ransacker :start_time, type: :time do
    Arel.sql('starts_at::time')
  end

  # ransacker :end_time, type: :time do
  #   Arel.sql('ends_at::time')
  # end

  def self.ransackable_attributes(_auth_object = nil)
    %w[id employee_name created_at updated_at hobbies gender email]
  end

  has_many :addresses
  accepts_nested_attributes_for :addresses,
                                allow_destroy: true,
                                reject_if: proc { |att|
                                             att['house_number'].blank? || att['society_name'].blank? || att['city'].blank? || att['area'].blank?
                                           }
end
