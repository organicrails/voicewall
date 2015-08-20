Rails.application.routes.draw do
  resources :voices
  root "voices#index"
end
