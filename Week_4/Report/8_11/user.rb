# frozen_string_literal: true

require 'faraday'
require 'json'

# Class User
class User
  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users'

  attr_accessor :id, :name, :sex, :active, :avatar, :created_at

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @sex = attributes[:sex]
    @active = attributes[:active]
    @avatar = attributes[:avatar]
    @created_at = attributes[:created_at]
  end

  def self.active_users
    response = Faraday.new(url: API_URL).get do |request|
      request.params['active'] = true
    end

    JSON.parse(response.body) if response.success?
  end

  def create
    response = connection.post do |request|
      request_headers(request)
      request.body = data
    end

    response.success?
  end

  def update
    response = connection.put do |request|
      request_headers(request)
      request.url @id
      request.body = data
    end

    response.success?
  end

  def delete
    response = connection.delete do |request|
      request.url @id
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

  def data
    {
      id: @id,
      name: @name,
      sex: @sex,
      active: @active,
      avatar: @avatar,
      created_at: @created_at
    }.compact.to_json
  end
end
