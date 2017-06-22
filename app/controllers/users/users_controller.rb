class Users::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render text: current_user.name
  end
end
