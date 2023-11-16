# frozen_string_literal: true

class Section < ApplicationRecord
  belongs_to :document
  has_many :paragraphs
end
