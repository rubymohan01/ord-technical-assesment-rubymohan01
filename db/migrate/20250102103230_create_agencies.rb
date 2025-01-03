class CreateAgencies < ActiveRecord::Migration[8.0]
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :website
      t.timestamps
    end
  end
end
