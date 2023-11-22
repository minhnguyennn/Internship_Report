class CreatePromotions < ActiveRecord::Migration[7.1]
  def change
    create_table :promotions do |t|
      t.time :end_date
      t.time :start_date
      t.timestamps
    end
  end
end
