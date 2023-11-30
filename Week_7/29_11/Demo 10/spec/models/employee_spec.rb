require 'rails_helper'
require 'ffaker'
require 'faker'

RSpec.describe Employee, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:employee_name) }
    it { should validate_length_of(:employee_name).is_at_least(3) }
  end

  describe '.ransackable_associations' do
    it 'returns an array of searchable fields' do
      searchable_fields = Employee.ransackable_associations
      expected_fields = %w[employee_name_or_hobbies_cont]
      expect(searchable_fields).to eq(expected_fields)
    end
    it 'returns an array containing specific fields' do
      searchable_fields = Employee.ransackable_associations
      expect(searchable_fields).to include('employee_name_or_hobbies_cont')   
    end
  end

  describe '.ransackable_attributes' do
    let(:expected_attrs) do
      %w[id employee_name created_at updated_at hobbies gender email avatar]
    end
    
    it 'returns the expected array of attributes' do
      ransackable_attrs = Employee.ransackable_attributes
      expect(ransackable_attrs).to contain_exactly(*expected_attrs)
    end
  end

  describe "nested attributes for addresses" do
    it "allows destroying addresses" do
      employee = Employee.create!(
        employee_name: 'Minh',
        gender: 'nam',
        hobbies: 'Da banh',
        email: 'minh@gmail.com',
        addresses_attributes: [
          { house_number: '123', society_name: 'Society A', city: 'City A', area: 'Area A' }
        ]
      )
      expect {
        employee.update(addresses_attributes: { "0" => { id: employee.addresses.first.id, _destroy: '1' } })
      }.to change { employee.addresses.count }.by(-1)
    end
    
  end

  it 'creates an employee' do
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
      employee_name = Employee.create(
        employee_name: employee_name
        )
      expect(
        employee_name.errors.messages[:employee_name]
        ).to eq(["is too short (minimum is 3 characters)"])
    end
  end
end
