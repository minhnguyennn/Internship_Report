# frozen_string_literal: true

# Project
class Project < ApplicationRecord
  has_many :tasks, dependent: true
end
