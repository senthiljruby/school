class TeachingStaffsController < ApplicationController
  before_filter :authenticate

  def index
    if params[:search]
      @teaching_staffs = TeachingStaff.search(params[:search])
                         .paginate(:page => params[:page], :per_page => 10, :order => 'created_at DESC')
    else
      @teaching_staffs = TeachingStaff.paginate(:page => params[:page], :per_page => 10, :order => 'created_at DESC')
    end    
  end

  def new
    @teaching_staff = TeachingStaff.new
  end

  def create
    @teaching_staff = TeachingStaff.new(params[:teaching_staff])
    if @teaching_staff.save
      flash[:notice] = "Saved"
      redirect_to teaching_staffs_path
    else
      flash[:notice] = "Error"
    end
  end

  def show
    @teaching_staff = TeachingStaff.find(params[:id])
  end

  def destroy
    @teaching_staff = TeachingStaff.find(params[:id])
    @teaching_staff.destroy
    redirect_to teaching_staffs_path
  end
end
