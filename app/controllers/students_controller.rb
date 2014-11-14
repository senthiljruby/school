class StudentsController < ApplicationController
  before_filter :authenticate

  def index
    if params[:search]
      @students = Student.search(params[:search])
                         .paginate(:page => params[:page], :per_page => 10, :order => 'created_at DESC')
    else
      @students = Student.paginate(:page => params[:page], :per_page => 10, :order => 'created_at DESC')
    end    
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      flash[:notice] = "Saved"
      redirect_to students_path
    else
      flash[:notice] = "Error"
    end
  end
end
