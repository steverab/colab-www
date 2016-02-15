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
      session[:user] = @user
      redirect_to action: "show", id: @user.id
    else
      redirect_to action: "show"
    end
  end

  # Login

  def show_login
    if session[:user].present?
      redirect_to action: "index", controller: "application"
    else
      render :login
    end
  end

  def make_login
    @user = User.login(:email => params["email"], :password => params["password"])
    if @user != nil && @user.id != nil
      session[:user] = @user
      redirect_to action: "show", id: @user.id
    else
      redirect_to action: "show"
    end
  end

  def logout
    reset_session
    redirect_to action: "index", controller: "application"
  end

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
