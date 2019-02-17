# frozen_string_literal:true

Rails.application.routes.draw do
  devise_for :users
  resources :chat_rooms, only: %i[new create show index]
  resources :messages
  root 'chat_rooms#index'
end
