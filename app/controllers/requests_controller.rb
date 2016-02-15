class RequestsController < ApplicationController
  before_action :set_requests, only: [:show, :edit, :update, :destroy]

  def list
    @requests = Request.all

    @requestPerDayCountDict = {}
    all = @requests.clone.as_json
    all.group_by{ |h| h['created_at'][0..9]}.each do |req, items|
      @requestPerDayCountDict[req] = items.length
    end

    @countryCountDict = {}
    all = @requests.clone.as_json
    all.group_by{ |h| h['country'] }.each do |loc,items|
      @countryCountDict[loc] = items.length
    end

    @orgCountDict = {}
    all = @requests.clone.as_json
    all.group_by{ |h| h['organization'] }.each do |org,items|
      @orgCountDict[org] = items.length
    end

    @eduCountDict = {"Educational Institution" => 0, "Other" => 0}
    all = @requests.clone.as_json
    all.group_by{ |h| h['reverse'] }.each do |rev,items|
      if rev.split(".").last != nil && rev.split(".").last.downcase == "edu"
        @eduCountDict["Educational Institution"] = @eduCountDict["Educational Institution"] + items.length
      else
        @eduCountDict["Other"] = @eduCountDict["Other"] + items.length
      end
    end

    render :list
  end

end
