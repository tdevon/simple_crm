class AddContactToSales < ActiveRecord::Migration[6.0]
  def change
    add_reference :sales, :contact, foreign_key: true
  end
end
