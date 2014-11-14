class Student < ActiveRecord::Base
  attr_accessible :name, :father_name, :standard, :section, :phone_number, :email, :address, :dob
  
  def self.search(query)
    where("name like ?", "%#{query}%") 
  end
end
