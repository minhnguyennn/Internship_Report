class AddLegacyCodeToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :legacy_code, :string
  end
end
