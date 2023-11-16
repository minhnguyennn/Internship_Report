# frozen_string_literal: true

class CreateParts < ActiveRecord::Migration[7.1]
  def change
    create_table :parts do |t|
      t.string :part_number

      t.timestamps
    end
  end
end
