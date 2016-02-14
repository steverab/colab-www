class User < ActiveRestClient::Base
  base_url Rails.application.config.api_server_url

  get :all, "/users"
  get :find, "/users/:id"
  put :save, "/users/:id"
  post :create, "/users"
end
