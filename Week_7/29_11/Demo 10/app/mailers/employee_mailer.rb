# frozen_string_literal: true

class EmployeeMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @employee = params[:employee]
    @url = 'https://www.google.com/'
    mail(to: @employee.email, subject: 'Welcome to My Awesome Site')
  end
end
