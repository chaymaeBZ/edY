class SessionsController < ApplicationController
  def new
    @session = Session.new
    @selections = Course.all
  end

  def create
    @session = Session.new(session_params)
    if @session.save
      redirect_to sessions_path, notice: "The session has been successfully created"
    else
      render 'new'
    end
  end

  def index
    @sessions = Session.order("created_at DESC")    
  end

  def show
    @session = Session.find(params[:id])
  end

  private
    def session_params
      params.require(:session).permit(:start_date, :end_date, :title, :description, :course_ids => [])
    end
end
