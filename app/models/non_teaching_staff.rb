class NonTeachingStaff < ActiveRecord::Base
  attr_accessible :full_name, :father_name, :date_of_birth, :date_of_joining, :married,
                  :email, :address, :mobile, :spouse_name, :qualification, :role, :aniversary_date

  def self.search(query)
    where("full_name like ?", "%#{query}%") 
  end

  def birthday_date
    date_of_birth.strftime("%d/%m")
  end

  def job_anniversary
    date_of_joining.strftime("%d/%m")
  end

  def wedding_anniversary
    aniversary_date.strftime("%d/%m")
  end

  def self.fetch_birthday
    birthday = []
    self.all.each do |non_teacher|
      if(non_teacher.birthday_date == "#{Date.today.day}/#{Date.today.month}")
        birthday << non_teacher 
      end
    end
    return birthday
  end

  def self.fetch_job_anniversary
    job_anniversary = []
    self.all.each do |non_teacher|
      if(non_teacher.job_anniversary == "#{Date.today.day}/#{Date.today.month}")
        job_anniversary << non_teacher 
      end
    end
    return job_anniversary
  end

  def self.fetch_wedding_anniversary
    wedding_anniversary = []
    self.all.each do |non_teacher|
      if(non_teacher.wedding_anniversary == "#{Date.today.day}/#{Date.today.month}")
        wedding_anniversary << non_teacher 
      end
    end
    return wedding_anniversary
  end  

end
