class Contest < ActiveRestClient::Base
  base_url Rails.application.config.api_server_url

  get :all, "/contests"
  get :find, "/contests/:id"
  put :save, "/contests/:id"
  post :create, "/contests"
end
