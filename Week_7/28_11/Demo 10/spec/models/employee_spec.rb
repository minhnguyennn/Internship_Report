require 'rails_helper'

RSpec.describe Employee, type: :model do
 it 'creates an employee' do
    Employee.create(
      employee_name: 'ABC'
    )
    expect(Employee.count).to eq(1)
  end

  context 'negative cases' do

    it 'fails if employee_name is of whitespaces' do
      employee = Employee.create(
        employee_name: '      '
      )

      expect(
        employee.errors.messages[:employee_name]
      ).to eq(["can't be blank"])
    end

    it 'fails if employee_name is of whitespaces' do
      employee = Employee.create(
        employee_name: '     '
        )
    end

    expect(
      employee.errors.messages[:employee_name]
      ).to eq(["can't be blank"])
  end
end
