# frozen_string_literal: true

class Employee < ApplicationRecord
  def self.ransackable_associations(_auth_object = nil)
    %w[employee_name_or_hobbies_cont]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[id employee_name created_at updated_at hobbies gender email avatar]
  end

  has_many :addresses

  has_one_attached :avatar

  # has_rich__tetx :back_ground

  accepts_nested_attributes_for :addresses,
                                allow_destroy: true,
                                reject_if: proc { |att|
                                             att['house_number'].blank? || att['society_name'].blank? || att['city'].blank? || att['area'].blank?
                                           }
end
