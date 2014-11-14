class AddDateOfBirthToStudents < ActiveRecord::Migration
  def change
    add_column :students, :dob, :string
  end
end
