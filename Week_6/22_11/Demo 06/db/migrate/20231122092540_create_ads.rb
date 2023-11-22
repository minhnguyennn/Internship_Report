# frozen_string_literal: true

class CreateAds < ActiveRecord::Migration[7.1]
  def change
    create_table :ads do |t|
      t.belongs_to :magazine, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
