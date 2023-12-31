# frozen_string_literal: true

json.extract! employee, :id, :employee_name, :gender, :hobbies, :created_at, :updated_at
json.url employee_url(employee, format: :json)
