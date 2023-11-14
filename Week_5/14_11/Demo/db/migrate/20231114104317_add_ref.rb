class AddRef < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :articles, :authors
  end
end
