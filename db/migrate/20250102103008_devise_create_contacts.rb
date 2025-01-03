# frozen_string_literal: true

class DeviseCreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :phone, null: false, default: ""
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.references :contactable, polymorphic: true, null: false
      t.timestamps null: false
    end

    add_index :contacts, :email,                unique: true
    add_index :contacts, :reset_password_token, unique: true
  end
end
