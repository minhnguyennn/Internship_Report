require 'rails_helper'

RSpec.describe EmployeeMailer, type: :mailer do
  describe 'welcome_email' do
    let(:employee) { create(:employee, email: 'test@example.com') } # Assuming you have a factory for Employee

    let(:mail) { described_class.with(employee: employee).welcome_email }

    it 'renders the headers' do
      expect(mail.subject).to eq('Welcome to My Awesome Site')
      expect(mail.to).to eq([employee.email])
      expect(mail.from).to eq(['notifications@example.com'])
    end
  end
end
