class ContestsController < ApplicationController
  before_action :set_contest, only: [:show, :edit, :update, :destroy]

  def list
    @contests = Contest.all
    render :list
  end

  def show
    @contest = Contest.find(params[:id])
    render :show
  end

  def set_contest
  end

end
