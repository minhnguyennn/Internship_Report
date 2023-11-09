# frozen_string_literal: true

require 'faker'
require 'faraday'
require 'json'

#Faker data
class FakeDataGenerator
  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users'
  @@connection = Faraday.new(url: API_URL)

  def self.post_fake_data
    data = generate_fake_data
    response = @@connection.post do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = data.to_json
    end

    if response.success?
      puts "API Response: #{response.body}"
    else
      puts "API Request failed with status #{response.status}: #{response.body}"
      # or raise an exception, depending on your error handling strategy
    end
  end

  def self.generate_fake_data
    {
      name: Faker::Name.name,
      sex: Faker::Gender.binary_type,
      active: Faker::Boolean.boolean,
      avatar: Faker::Avatar.image
    }
  end
end

# Example usage:
FakeDataGenerator.generate_fake_data
FakeDataGenerator.post_fake_data
