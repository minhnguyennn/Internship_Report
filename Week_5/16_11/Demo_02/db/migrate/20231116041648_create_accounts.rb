# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.belongs_to :suppliers
      t.string :account_number
      t.timestamps
    end
  end
end
