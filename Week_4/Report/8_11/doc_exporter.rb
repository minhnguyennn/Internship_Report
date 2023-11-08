# frozen_string_literal: true

require 'caracal'

# Class DocExporter
class DocExporter
  def initialize(users)
    @users = users
  end

  def read_data
    headers = %w[Id Name Sex Active Avatar Created_at]
    format_data(users, headers)
  end

  def format_data(users, headers)
    [headers] + users.map do |value|
      [
        value['id'],
        value['name'],
        value['sex'],
        value['active'],
        value['avatar'],
        value['created_at']
      ]
    end
  end

  def execute
    Caracal::Document.save 'example.docx' do |docx|
      docx.table read_data, border_size: 4 do
        border_top do
          color   '000000'
          line    :double
          size    8
          spacing 2
        end
      end
    end
  end
end
