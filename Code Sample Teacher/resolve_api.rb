class User
  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users'.freeze

  attr_accessor :id, :name, :sex, :active, :avatar, :created_at

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @sex = attributes[:sex]
    @active = attributes[:active]
    @avatar = attributes[:avatar]
    @created_at = attributes[:created_at]
    @connection = connection
  end

  def self.active_users
    response = @connection.get do |request|
      request.params['active'] = true
    end

    return JSON.parse(response.body) if response.success?

    []
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
      request.body = data
      request.url @id
    end

    response.success?
  end

  def delete
    response = @connection.delete do |request|
      request.headers['Content-Type'] = 'application/json'
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
      attributes[:active] = @active unless @active.to_s.empty?
      attributes[:sex] = @sex unless @sex.to_s.empty?
      attributes[:avatar] = @avatar unless @avatar.to_s.empty?
      attributes[:created_at] = @created_at unless @created_at.to_s.empty?
    end.to_json
  end
end
