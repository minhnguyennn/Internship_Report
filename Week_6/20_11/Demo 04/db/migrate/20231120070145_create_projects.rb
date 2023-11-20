# frozen_string_literal: true

# CreateProjects
class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects, &:timestamps
  end
end
