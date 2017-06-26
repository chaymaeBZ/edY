class SessionsController < ApplicationController
  def new
    @session = Session.new   
  end

  def create
    # Time.now.parse!(session_params[:start_date])
    # Time.now.parse!(session_params[:end_date])
    @session = Session.new(session_params)
    if @session.save
      redirect_to sessions_path, notice: "The session has been successfully created"
    else
      render action: 'new'
    end
  end

  def index
    @sessions = Session.active.order("created_at DESC")    
  end

  def show
    @session = Session.find(params[:id])
    @courses = @session.courses
  end

  private
    def session_params
      params.require(:session).permit(:start_date, :end_date, :title, :description, :course_ids => [])
    end
end
