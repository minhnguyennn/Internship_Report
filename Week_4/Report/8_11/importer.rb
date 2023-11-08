# frozen_string_literal: true

require 'faraday'
require 'json'
require 'csv'

# Class Importer
class Importer
  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users'

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
  end

  def execute
    CSV.foreach(@csv_file_path, headers: true) do |row|
      user_data = {
        name: row['name'],
        avater: row['avatar'],
        sex: row['sex']
      }
      importer(user_data)
    end
  end

  def importer(user_data)
    response = connection.post do |request|
      request_headers(request)
      request.body = user_data.to_json
    end

    response.success?
  end

  private

  def connection
    @connection ||= Faraday.new(url: API_URL)
  end

  def request_headers(request)
    request.headers['Content-Type'] = 'application/json'
  end
end
