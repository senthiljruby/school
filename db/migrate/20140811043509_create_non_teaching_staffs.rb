class CreateNonTeachingStaffs < ActiveRecord::Migration
  def change
    create_table :non_teaching_staffs do |t|
      t.string :full_name
      t.string :father_name
      t.date :date_of_birth
      t.date :date_of_joining
      t.boolean :married
      t.string :spouse_name
      t.date :aniversary_date
      t.string :qualification
      t.string :role
      t.string :email
      t.string :mobile
      t.text :address

      t.timestamps
    end
  end
end
