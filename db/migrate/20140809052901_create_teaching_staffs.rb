class CreateTeachingStaffs < ActiveRecord::Migration
  def change
    create_table :teaching_staffs do |t|
      t.string :full_name
      t.string :father_name
      t.date :date_of_joining
      t.date :date_of_birth
      t.boolean :married
      t.string :spouse_name
      t.date :aniversary_date
      t.string :qualification
      t.string :role

      t.timestamps
    end
  end
end
