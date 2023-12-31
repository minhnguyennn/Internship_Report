# frozen_string_literal: true

require 'faraday'
require 'json'
require 'csv'

# Class User
class User
  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users'

  attr_accessor :id, :name, :sex, :active, :avatar, :created_at

  @@connection ||= Faraday.new(url: API_URL)

  def initialize(attribute)
    @id = attribute[:id]
    @name = attribute[:name]
    @sex = attribute[:sex]
    @active = attribute[:active]
    @avatar = attribute[:avatar]
    @created_at = attribute[:created_at]
  end

  def self.active_users
    response = Faraday.new(url: API_URL).get do |request|
      request.params['active'] = true
    end

    return JSON.parse(response.body) if response.success?

    []
  end

  def self.read_csv
    CSV.foreach('users.csv', headers: true) do |row|
      user_data = {
        name: row['name'],
        avater: row['avatar'],
        sex: row['sex']
      }
      User.import_csv(user_data)
    end
  end

  def self.import_csv(user_data)
    p user_data

    response = @@connection.post do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = user_data.to_json
    end

    response.success?
  end

  def create
    response = @@connection.post do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = data
    end

    response.success?
  end

  def update
    response = @@connection.put do |request|
      request.headers['Content-Type'] = 'application/json'
      request.url @id
      request.body = data
    end

    response.success?
  end

  def delete
    response = @@connection.delete do |request|
      request.url @id
    end

    response.success?
  end

  def data
    {}.tap do |attributes|
      attributes[:id] = @id unless @id.to_s.empty?
      attributes[:name] = @name unless @name.to_s.empty?
      attributes[:sex] = @sex unless @sex.to_s.empty?
      attributes[:active] = @active unless @active.to_s.empty?
      attributes[:avatar] = @avatar unless @avatar.to_s.empty?
      attributes[:created_at] = @created_at unless @created_at.to_s.empty?
    end.to_json
  end
end
# user = User.new({id: '276'})
# user.delete
User.read_csv
