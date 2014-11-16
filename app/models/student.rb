class Student < ActiveRecord::Base
  attr_accessible :name, :father_name, :standard, :section, :phone_number, :email, :address, :dob
  
  def self.search(query)
    where("name like ?", "%#{query}%") 
  end

  def birthday_date
    dob.strftime("%d/%m")
  end

  def self.fetch_birthday
    birthday = []
    self.all.each do |student|
      if(student.birthday_date == "#{Date.today.day}/#{Date.today.month}")
        birthday << student 
      end
    end
    return birthday
  end
end
