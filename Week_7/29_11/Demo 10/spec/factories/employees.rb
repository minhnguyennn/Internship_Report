FactoryBot.define do
  factory :employee do
    employee_name { FFaker::NameJA.name }
  end
end
