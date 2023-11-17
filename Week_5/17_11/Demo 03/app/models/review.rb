# frozen_string_literal: true

# Review
class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :book

  enum :state, %i[not_reviewed published hidden]
end
