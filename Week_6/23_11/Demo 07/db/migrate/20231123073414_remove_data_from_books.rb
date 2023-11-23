# frozen_string_literal: true

class RemoveDataFromBooks < ActiveRecord::Migration[7.1]
  def change
    def up
      Book.destroy_all
    end

    def down; end
  end
end
