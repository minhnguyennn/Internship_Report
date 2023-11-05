# frozen_string_literal: true

resolve_api.rb

require 'faraday'
require 'json'

# Địa chỉ của API
api_url = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users'

# Tạo một kết nối đến API bằng Faraday
# conn = Faraday.new(url: api_url)
conn = Faraday.new(url: api_url) do |faraday|
  faraday.request  :url_encoded
  faraday.response :logger
  faraday.adapter  Faraday.default_adapter
end

conn.post do |req|
  req.url '/users'
  req.headers['Content-Type'] = 'application/json'
  req.body = new_user_data.to_json
end

# Lấy danh sách tất cả người dùng có thuộc tính "active" là true
response = conn.get do |req|
  req.url '/users'
  req.params['active'] = true
end

if response.success?
  users = JSON.parse(response.body)
  puts 'Danh sách người dùng có thuộc tính \'active\' là true:\n\n'
  users.each do |user|
    puts "ID: #{user['id']},\nTên: #{user['name']},\nGiới tính: #{user['sex']},\n" \
    "Trạng thái: #{user['active']},\nNgày tạo: #{user['created_at']},\n" \
    "Hình ảnh: #{user['avatar']}\n\n"
  end
else
  puts 'Error'
end

# Tạo một người dùng mới
new_user_data = {
  created_at: Time.now.strftime('%Y-%m-%d %H:%M:%S %z'),
  name: 'Nguyễn Văn Minh',
  avatar: 'https://duhocvietglobal.com/wp-content/uploads/2018/12/dat-nuoc-va-con-nguoi-anh-quoc.jpg',
  sex: 'male',
  active: true,
  id: '18011999'
}

response = conn.post do |req|
  req.url '/users'
  req.headers['Content-Type'] = 'application/json'
  req.body = JSON.generate(new_user_data)
end

if response.success?
  JSON.parse(response.body)
  puts 'Người dùng mới đã được tạo:'
  puts "ID: #{user['id']},\nTên: #{user['name']},\nGiới tính: #{user['sex']},\n" \
    "Trạng thái: #{user['active']},\nNgày tạo: #{user['created_at']},\n" \
    "Hình ảnh: #{user['avatar']}\n\n"
else
  puts 'Lỗi khi tạo người dùng mới.'
end

# Xóa một người dùng
response = conn.delete('/users/179')

# Lệnh kiểm tra lỗi
response.status
response.body
response.headers
