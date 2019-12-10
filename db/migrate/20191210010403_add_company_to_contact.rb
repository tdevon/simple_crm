class AddCompanyToContact < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :company, :string
    add_column :contacts, :notes, :text
  end
end
