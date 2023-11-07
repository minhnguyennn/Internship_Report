# frozen_string_literal: true

table_user.rb

require 'faraday'
require 'json'
require 'caracal'

class User
  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users'

  attr_accessor :id, :name, :sex, :active, :avatar, :created_at

  def initialize(attribute)
    @id = attribute[:id]
    @name = attribute[:name]
    @sex = attribute[:sex]
    @active = attribute[:active]
    @avatar = attribute[:avatar]
    @created_at = attribute[:created_at]
    @connection = connection
    @user_data = {}
  end

  def self.active_users
    response = Faraday.new(url: API_URL).get do |request|
      request.params['active'] = true
    end

    return JSON.parse(response.body) if response.success?

    []
  end

  def self.info_users
    response = Faraday.new(url: API_URL).get
    @user_data = JSON.parse(response.body)

    response.success?
  end

  def self.create_table
    data = @user_data.map(&:values)

    Caracal::Document.save 'example.docx' do |docx|
      docx.table data, border_size: 4 do
        
        border_top do
          color   '000000'
          line    :double
          size    8
          spacing 2
        end
      end
    end
  end

  def create
    response = @connection.post do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = data
    end

    response.success?
  end

  def update
    response = @connection.put do |request|
      request.headers['Content-Type'] = 'application/json'
      request.url @id
      request.body = data
    end

    response.success?
  end

  def delete
    response = @connection.delete do |request|
      request.url @id
    end

    response.success?
  end

  private

  def connection
    @connection ||= Faraday.new(url: API_URL)
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

# user = User.new({name: 'minh', sex: 'male'})
User.info_users
User.create_table
