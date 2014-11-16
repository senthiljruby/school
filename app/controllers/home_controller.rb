class HomeController < ApplicationController
  before_filter :authenticate
  def index
    @students = Student.all
    @last_student = Student.last
    @teachers = TeachingStaff.all
    @last_teacher = TeachingStaff.last
    @non_teachers = NonTeachingStaff.all
    @last_non_teacher = NonTeachingStaff.last
  end
end
