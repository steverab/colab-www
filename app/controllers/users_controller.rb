class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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

end
