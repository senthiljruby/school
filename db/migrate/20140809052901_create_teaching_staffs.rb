class CreateTeachingStaffs < ActiveRecord::Migration
  def change
    create_table :teaching_staffs do |t|
      t.string :full_name
      t.string :father_name
      t.string :date_of_joining
      t.string :date_of_birth
      t.boolean :married
      t.string :spouse_name
      t.string :aniversary_date
      t.string :qualification
      t.string :role

      t.timestamps
    end
  end
end
