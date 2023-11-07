# frozen_string_literal: true

create_chart.rb

require 'faraday'
require 'json'
require 'caracal'
require 'gruff'

# Class USER
class User
  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users'

  attr_accessor :id, :name, :sex, :active, :avatar, :created_at

  @@user_data = nil

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

  def self.info_users
    response = Faraday.new(url: API_URL).get
    @@user_data = JSON.parse(response.body)

    response.success?
  end

  def setting_table(docx); end

  def self.create_chart
    puts '******************************'
    count_male = 0
    @@user_data.each do |element|
      element.each { |_key, value| count_male += 1 if value == 'male' }
    end
    puts count_male
    puts '******************************'
    count_female = 0
    @@user_data.each do |element|
      element.each { |_key, value| count_female += 1 if value == 'female' }
    end
    puts count_female
    puts '******************************'
    g = Gruff::Mini::Pie.new
    g.title = 'Good job !'
    g.data 'Male', count_male
    g.data 'Fimale', count_female
    g.write('mini_pie_keynote.png')

    # Lấy đường dẫn của thư mục hiện tại (thư mục gốc của ứng dụng Ruby)
    current_directory = Dir.pwd

    # Tên tệp hình ảnh (ví dụ: logo.png)
    image_filename = 'mini_pie_keynote.png'

    # Kết hợp đường dẫn thư mục hiện tại và tên tệp hình ảnh
    image_path = File.join(current_directory, image_filename)

    Caracal::Document.save 'example.docx' do |docx|
      docx.img image_path do
        width   250
        height  200
        align   :left
      end
    end
  end

  def self.create_table
    headers = %w[Id Name Sex Active Avatar Created_at]
    data = [headers] + @user_data.map do |value|
      [
        value['id'],
        value['name'],
        value['sex'],
        value['active'],
        value['avatar'],
        value['created_at']
      ]
    end

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

User.info_users
User.create_chart
