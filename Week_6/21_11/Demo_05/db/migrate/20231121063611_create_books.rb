class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :name
      t.boolean :out_of_print
      t.integer :published
      t.integer :price
      t.timestamps
    end
  end
end
