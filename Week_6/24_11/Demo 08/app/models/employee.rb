# frozen_string_literal: true

class Employee < ApplicationRecord
  has_many :addresses
  accepts_nested_attributes_for :addresses,
                                allow_destroy: true,
                                reject_if: proc { |att|
                                             %w[house_number society_name city area].all? do |field|
                                               att[field].blank?
                                             end
                                           }
end
