# frozen_string_literal: true

Rails.application.routes.draw do
  resources :user_informations, only: %i[show]
  post 'search', to: 'user_informations#search'
  root to: 'user_informations#show'
end
