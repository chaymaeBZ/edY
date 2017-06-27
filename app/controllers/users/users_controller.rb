class Users::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render text: current_user.name
  end
  
  def sessions
    @sessions = current_user.sessions
    render 'users/sessions'
  end
end
