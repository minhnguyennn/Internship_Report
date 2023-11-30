# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    employee_name { Faker::Name.name }
  end
end
