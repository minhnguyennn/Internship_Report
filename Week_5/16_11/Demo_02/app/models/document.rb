# frozen_string_literal: true

class Document < ApplicationRecord
  has_many :sections
  has_many :paragraphs, through: :sections
end
