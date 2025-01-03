class CreateAgents < ActiveRecord::Migration[8.0]
  def change
    create_table :agents do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :ref_code
      t.date :dob
      t.string :gender
      t.references :agency, null: false, foreign_key: true
      t.timestamps
    end

    add_index :agents, :email, unique: true
  end
end
