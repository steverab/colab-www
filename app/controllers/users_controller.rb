class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :edit, :update, :destroy]

  # Register

  def show_register
    render :register
  end

  def make_register
    params.each do |param|
      p param
    end
    @user = User.create(:first_name => params["first_name"], :last_name => params["last_name"], :screen_name => params["screen_name"], :email => params["email"], :password => params["password"], :short_bio => params["short_bio"])

    if @user != nil && @user.id != nil
      redirect_to action: "show", id: @user.id
    else
      redirect_to action: "show"
    end
  end

  # Login

  

  # List

  def list
    @users = User.all
    render :list
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def set_user
  end

  # Update

end
