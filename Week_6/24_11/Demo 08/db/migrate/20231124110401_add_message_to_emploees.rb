class AddMessageToEmploees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :message, :text
  end
end
