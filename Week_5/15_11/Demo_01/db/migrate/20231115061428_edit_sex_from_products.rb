class EditSexFromProducts < ActiveRecord::Migration[7.1]
  def change
    change_column :people, :sex, :string
  end
end
