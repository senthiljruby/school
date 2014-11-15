class TeachingStaff < ActiveRecord::Base
  attr_accessible :full_name, :father_name, :date_of_birth, :date_of_joining, :married,
                  :email, :address, :mobile, :spouse_name, :qualification, :role, :aniversary_date

  def self.search(query)
    where("full_name like ?", "%#{query}%") 
  end
end
