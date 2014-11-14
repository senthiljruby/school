class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :father_name
      t.string :phone_number
      t.string :email
      t.text :address

      t.timestamps
    end
  end
end
