class AddStandardAndSectionToStudents < ActiveRecord::Migration
  def change
    add_column :students, :standard, :string
    add_column :students, :section, :string
  end
end
