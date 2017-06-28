class SessionsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?, only: [:new, :edit, :update]
  before_action :find, only: [:show, :edit, :update]
  def new
    @session = Session.new   
  end

  def create
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
  
  def edit
  end

  def update
    if @session.update_attributes(session_params)
      redirect_to sessions_path, notice: "The session has been updated"
    else
      render 'edit'
    end
  end

  def show
    if @session.users.include?(current_user)
      render 'sessions/show_bought'
    end
  end

  def statistics
  end


  private
    def session_params
      params.require(:session).permit(:start_date, :end_date, :title, :description, :price, :course_ids => [])
    end

    def find
      @session = Session.find(params[:id])
      @courses = @session.courses
    end
end
