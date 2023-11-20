# frozen_string_literal: true

# Post
class Post < ApplicationRecord
  # enum :status, [ :draft, :publishted, :archived, :trashed ]
  # enum :status, %i(draft published archived trashed)
  enum :status, { draft: 0, published: 1, archived: 2, trashed: 3 }, prefix: true
  enum :category, { free: 0, premium: 1 }, suffix: true
end
