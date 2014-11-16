class HomeController < ApplicationController
  before_filter :authenticate
  def index
    @students = Student.all
    @last_student = Student.last
    @teachers = TeachingStaff.all
    @last_teacher = TeachingStaff.last
    @non_teachers = NonTeachingStaff.all
    @last_non_teacher = NonTeachingStaff.last
    @sms = Sms.all
    @last_sms = Sms.last

    #Birthday
    @birthday_name = []
    @birthday_phone_number = []
    @birthday_role = []
    today = Date.today.strftime("%d/%m/%Y")
    # student_birthdays = Student.find_all_by_dob(today)
    # student_birthdays = Student.where(["DAY(dob) = ? AND MONTH(dob) = ?", Date.today.day, Date.today.month])
    student_birthdays = Student.fetch_birthday
    student_birthdays.each do |student_birthday|
      @birthday_name << student_birthday.name
      @birthday_phone_number << student_birthday.phone_number
      @birthday_role << "Class : " + student_birthday.standard + " - " + student_birthday.section
    end

    # teachers_birthdays = TeachingStaff.where(["DAY(date_of_birth) = ? AND MONTH(date_of_birth) = ?", 
    #                                     Date.today.day, Date.today.month])

    teachers_birthdays = TeachingStaff.fetch_birthday
    teachers_birthdays.each do |teachers_birthday|
      @birthday_name << teachers_birthday.full_name
      @birthday_phone_number << teachers_birthday.mobile
      @birthday_role << teachers_birthday.role
    end

    # non_teachers_birthdays = NonTeachingStaff.where(["DAY(date_of_birth) = ? AND MONTH(date_of_birth) = ?", 
                                        # Date.today.day, Date.today.month])
    non_teachers_birthdays = NonTeachingStaff.fetch_birthday
    non_teachers_birthdays.each do |non_teachers_birthday|
      @birthday_name << non_teachers_birthday.full_name
      @birthday_phone_number << non_teachers_birthday.mobile
      @birthday_role << non_teachers_birthday.role
    end

    # Job anniversary
    @job_anniversary_name = []
    @job_anniversary_phone_number = []
    @job_anniversary_role = []

    teachers_job_anniversaries = TeachingStaff.fetch_job_anniversary
    # teachers_job_anniversaries = TeachingStaff.where(["DAY(date_of_joining) = ? AND MONTH(date_of_joining) = ?", 
    #                                     Date.today.day, Date.today.month])
    teachers_job_anniversaries.each do |teachers_job_anniversary|
      @job_anniversary_name << teachers_job_anniversary.full_name
      @job_anniversary_phone_number << teachers_job_anniversary.mobile
      @job_anniversary_role << teachers_job_anniversary.role
    end

    non_teachers_job_anniversaries = NonTeachingStaff.fetch_job_anniversary
    # non_teachers_job_anniversaries = NonTeachingStaff.where(["DAY(date_of_joining) = ? AND MONTH(date_of_joining) = ?", 
    #                                     Date.today.day, Date.today.month])
    non_teachers_job_anniversaries.each do |non_teachers_job_anniversary|
      @job_anniversary_name << non_teachers_job_anniversary.full_name
      @job_anniversary_phone_number << non_teachers_job_anniversary.mobile
      @job_anniversary_role << non_teachers_job_anniversary.role
    end

    # Wedding anniversary
    @wedding_anniversary_name = []
    @wedding_anniversary_phone_number = []
    @wedding_anniversary_role = []

    teachers_wedding_anniversaries = TeachingStaff.fetch_wedding_anniversary
    # teachers_wedding_anniversaries = TeachingStaff.where(["DAY(aniversary_date) = ? AND MONTH(aniversary_date) = ?", 
    #                                     Date.today.day, Date.today.month])
    teachers_wedding_anniversaries.each do |teachers_wedding_anniversary|
      @wedding_anniversary_name << teachers_wedding_anniversary.full_name
      @wedding_anniversary_phone_number << teachers_wedding_anniversary.mobile
      @wedding_anniversary_role << teachers_wedding_anniversary.role
    end


    non_teachers_wedding_anniversaries = NonTeachingStaff.fetch_wedding_anniversary
    # non_teachers_wedding_anniversaries = NonTeachingStaff.where(["DAY(aniversary_date) = ? AND MONTH(aniversary_date) = ?", 
    #                                     Date.today.day, Date.today.month])
    non_teachers_wedding_anniversaries.each do |non_teachers_wedding_anniversary|
      @wedding_anniversary_name << non_teachers_wedding_anniversary.full_name
      @wedding_anniversary_phone_number << non_teachers_wedding_anniversary.mobile
      @wedding_anniversary_role << non_teachers_wedding_anniversary.role
    end
  end
end
