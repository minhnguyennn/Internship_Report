# frozen_string_literal: true

# AddStatusToPosts
class AddStatusToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :status, :integer, default: 0
  end
end
