class TeachingStaffsController < InheritedResources::Base
  before_filter :authenticate

  def index
    if params[:search]
      @teaching_staffs = TeachingStaff.search(params[:search])
                         .paginate(:page => params[:page], :per_page => 10, :order => 'created_at DESC')
    else
      @teaching_staffs = TeachingStaff.paginate(:page => params[:page], :per_page => 10, :order => 'created_at DESC')
    end    
  end

  def build_resource_params
    [params.fetch(:teaching_staff, {}).permit(:full_name, :father_name,
                                       :date_of_birth, :date_of_joining, :married,
                                       :email, :address, :mobile, :spouse_name,
                                       :qualification, :role)]
  end
end
