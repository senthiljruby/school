class AlertsController < ApplicationController
  before_filter :authenticate

  def quick_sms
  end

  def noticeboard
    @teachers = TeachingStaff.all
    @sections = ('A'..'Z').to_a
    @standards = (1..12).to_a
    @non_teachers = NonTeachingStaff.all
  end

  def send_message
    setting = Settings.first
    waysms = WaySms::SmsSender.new(setting.username, setting.password)
    waysms.send(params[:mobile_number], "#{params[:messages]} - by vetri School")
    Sms.create(:message => params[:messages])
    flash[:notice] = "Message Send Successfully"
    redirect_to alerts_quick_sms_path
  end

  def send_multi_message
    @teachers = params[:teachers]
    @student_standards = params[:student_standards]
    @student_sections = params[:student_sections]
    @non_teachers = params[:non_teachers]

    mobile_numbers = []
    
    unless @teachers.blank?
      @teachers.each do |teacher|
        teaching_staff = TeachingStaff.find_by_full_name(teacher)
        unless teaching_staff.blank?
          mobile_numbers << teaching_staff.mobile
        end
      end
    end

    unless @student_standards.blank?
      @student_standards.each do |standard|
        student_standard_lists = Student.find_all_by_standard(standard)
        unless student_standard_lists.blank?
          student_standard_lists.each do |student_standard_list|
            mobile_numbers << student_standard_list.phone_number
          end
        end
      end
    end

    unless @student_sections.blank?
      @student_sections.each do |section|
        student_section_lists = Student.find_all_by_standard(section)
        unless student_section_lists.blank?
          student_section_lists.each do |student_section_list|
            mobile_numbers << student_section_list.phone_number
          end
        end
      end
    end

    unless @non_teachers.blank?
      @non_teachers.each do |non_teacher|
        non_teaching_staff = NonTeachingStaff.find_by_full_name(non_teacher)
        unless non_teaching_staff.blank?
          mobile_numbers << non_teaching_staff.mobile
        end
      end
    end
    setting = Settings.first
    waysms = WaySms::SmsSender.new(setting.username, setting.password)
    mobile_numbers.uniq!.each do |mobile_number|  
      waysms.send(mobile_number, "#{params[:messages]} - by vetri School")
    end
    Sms.create(:message => params[:messages])
    flash[:notice] = "Message Send Successfully"
    redirect_to alerts_noticeboard_path
  end
end
