class CreateTouchpoints < ActiveRecord::Migration[6.0]
  def change
    create_table :touchpoints do |t|
      t.date :date
      t.string :details
      t.string :title
      t.references :contact, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
