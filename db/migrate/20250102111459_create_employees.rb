class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :ref_code
      t.date :dob
      t.string :gender
      t.string :job_title
      t.references :company, null: false, foreign_key: true
      t.timestamps
    end

    add_index :employees, :email, unique: true
  end
end
