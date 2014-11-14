class CreateNonTeachingStaffs < ActiveRecord::Migration
  def change
    create_table :non_teaching_staffs do |t|
      t.string :full_name
      t.string :father_name
      t.string :date_of_birth
      t.string :date_of_joining
      t.boolean :married
      t.string :spouse_name
      t.string :aniversary_date
      t.string :qualification
      t.string :role
      t.string :email
      t.string :mobile
      t.text :address

      t.timestamps
    end
  end
end
