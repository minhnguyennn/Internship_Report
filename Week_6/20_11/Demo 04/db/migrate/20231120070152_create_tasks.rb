# frozen_string_literal: true

# CreateTasks
class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks, &:timestamps
  end
end
