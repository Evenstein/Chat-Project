Rails.application.routes.draw do
  devise_for :users
  resources :chat_rooms, only: %i[new create show index]
  root 'chat_rooms#index'
end
