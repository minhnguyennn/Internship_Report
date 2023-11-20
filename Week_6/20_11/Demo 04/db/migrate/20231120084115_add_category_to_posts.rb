# frozen_string_literal: true

# AddCategoryToPosts
class AddCategoryToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :category, :integer, default: 0
  end
end
