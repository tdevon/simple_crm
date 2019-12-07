class ChangeCustomersToContacts < ActiveRecord::Migration[6.0]
  def change
    rename_table :customers, :contacts
  end
end
