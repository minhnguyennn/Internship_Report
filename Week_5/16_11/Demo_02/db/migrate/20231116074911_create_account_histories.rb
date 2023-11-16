# frozen_string_literal: true

class CreateAccountHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :account_histories do |t|
      t.belongs_to :account
      t.integer :credit_rating
      t.timestamps
    end
  end
end
