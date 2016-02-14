class RequestsController < ApplicationController
  before_action :set_requests, only: [:show, :edit, :update, :destroy]

  def list
    @requests = Request.all
    render :list
  end

end
