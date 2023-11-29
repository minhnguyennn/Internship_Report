require 'rails_helper'
require 'ffaker'
require 'faker'

RSpec.describe Employee, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:employee_name) }
    it { should validate_length_of(:employee_name).is_at_least(3) }
  end

  it 'creates an employee' do
    # employee_name = FFaker::NameJA.name
    # puts "Employee name: #{employee_name}"
    # employee = Employee.create(
    #   employee_name: employee_name
    # )
    # expect(employee).to be_valid

    employee = create(:employee)
    expect(employee).to be_valid
  end

  context 'negative cases' do
    it 'fails if employee_name is of whitespaces' do
      employee = Employee.create(
        employee_name: '     '
        )
    expect(
      employee.errors.messages[:employee_name]
      ).to eq(["can't be blank"])
    end

    it 'fails if employee_name less than 3 symbols' do
      employee_name = Faker::Lorem.characters(number: 2)
      puts "Employee name: #{employee_name}"
      employee_name = Employee.create(
        employee_name: employee_name
        )
      expect(
        employee_name.errors.messages[:employee_name]
        ).to eq(["is too short (minimum is 3 characters)"])
    end
  end
end
