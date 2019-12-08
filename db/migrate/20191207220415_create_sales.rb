class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.decimal :price
      t.date :date
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
