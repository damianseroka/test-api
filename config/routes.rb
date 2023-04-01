# frozen_string_literal: true

Rails.application.routes.draw do
  get '/common_ancestor', to: 'nodes#common_ancestors', defaults: { format: :json }
  resources :birds, only: :index, defaults: { format: :json }
end
