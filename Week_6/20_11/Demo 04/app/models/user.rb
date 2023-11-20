# frozen_string_literal: true

# User
class User < ApplicationRecord
  # has_many :posts
  enum :status, { invited: 0, active: 1, deactivated: 2 }, suffix: true
end
