# frozen_string_literal: true

json.extract! address, :id, :house_number, :society_name, :area, :city, :created_at, :updated_at
json.url address_url(address, format: :json)
