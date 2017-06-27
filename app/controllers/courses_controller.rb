class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?, only: [:new, :edit]
  before_action :find, only: [:show, :edit, :update]
  before_action :has_access, only: [:show ]
  
  def index
    @courses = Course.order("created_at DESC")
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path, notice: "this course has been successfully created"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    
    if @course.update_attributes(course_params)
      redirect_to courses_path, notice: "the course has been updated"
    else
      render 'edit'
    end
  end

  private 
    def course_params
      params.require(:course).permit(:title, :content)
    end
    
    def find 
      @course = Course.find(params[:id])
    end
    def has_access
      @find = false
      
      current_user.sessions.collect do |session|
        if session.courses.include?(@course)
          @find = true
        end
      end
      if @find == false
        redirect_to courses_path, notice: "You haven't bought that course yet! please look for it in a valid session"
      end
    end

end
