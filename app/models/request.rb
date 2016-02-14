class Request < ActiveRestClient::Base
  base_url Rails.application.config.api_server_url

  get :all, "/requests"
end
