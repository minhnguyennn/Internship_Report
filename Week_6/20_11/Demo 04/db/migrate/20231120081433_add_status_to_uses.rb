# frozen_string_literal: true

# AddStatusToUses
class AddStatusToUses < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :status, :integer, default: 0
  end
end
