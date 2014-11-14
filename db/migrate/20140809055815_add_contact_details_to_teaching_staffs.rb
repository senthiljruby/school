class AddContactDetailsToTeachingStaffs < ActiveRecord::Migration
  def change
    add_column :teaching_staffs, :email, :string
    add_column :teaching_staffs, :mobile, :string
    add_column :teaching_staffs, :address, :text
  end
end
