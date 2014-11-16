class HomeController < ApplicationController
  before_filter :authenticate
  def index
    @students = Student.all
    @last_student = Student.last
    @teachers = TeachingStaff.all
    @last_teacher = TeachingStaff.last
    @non_teachers = NonTeachingStaff.all
    @last_non_teacher = NonTeachingStaff.last

    #Birthday
    @birthday_name = []
    @birthday_phone_number = []
    @birthday_role = []
    today = Date.today.strftime("%d/%m/%Y")
    student_birthdays = Student.find_all_by_dob(today)
    student_birthdays.each do |student_birthday|
      @birthday_name << student_birthday.name
      @birthday_phone_number << student_birthday.phone_number
      @birthday_role << "Class : " + student_birthday.standard + " - " + student_birthday.section
    end
    teachers_birthdays = TeachingStaff.find_all_by_date_of_birth(today)    
  end
end
