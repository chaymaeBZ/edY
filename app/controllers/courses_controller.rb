class CoursesController < ApplicationController
  def index
    @courses = Course.order("created_at DESC")
  end

  def show
    @course = Course.find(params[:id])
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
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
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
      
end
