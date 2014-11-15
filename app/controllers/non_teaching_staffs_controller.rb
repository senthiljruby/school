class NonTeachingStaffsController < ApplicationController
  before_filter :authenticate

  def index
    if params[:search]
      @non_teaching_staffs = NonTeachingStaff.search(params[:search])
                         .paginate(:page => params[:page], :per_page => 10, :order => 'created_at DESC')
    else
      @non_teaching_staffs = NonTeachingStaff.paginate(:page => params[:page], :per_page => 10, :order => 'created_at DESC')
    end    
  end
  
  def new
    @non_teaching_staff = NonTeachingStaff.new
  end

  def create
    @non_teaching_staff = NonTeachingStaff.new(params[:teaching_staff])
    if @non_teaching_staff.save
      flash[:notice] = "Saved"
      redirect_to non_teaching_staffs_path
    else
      flash[:notice] = "Error"
    end
  end

  def show
    @non_teaching_staff = NonTeachingStaff.find(params[:id])
  end

  def destroy
    @non_teaching_staff = NonTeachingStaff.find(params[:id])
    @non_teaching_staff.destroy
    redirect_to non_teaching_staffs_path
  end
end
