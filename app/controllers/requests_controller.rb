class RequestsController < ApplicationController
  before_action :set_requests, only: [:show, :edit, :update, :destroy]

  def list
    @requests = Request.all

    @countryCountMap = {}

    all = @requests.clone.as_json
    all.group_by{ |h| h['country'] }.each do |loc,items|
      puts "#{loc}: #{items.length} request#{:s if items.length!=1}"
      @countryCountMap[loc] = items.length
      #print "--> "
      #puts events.map{ |e| e['status'] }.join(', ')
    end

    render :list
  end

end
