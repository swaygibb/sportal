Rails.application.routes.draw do
  resources :userinfo
  resources :authorize
  resources :spotifycallback
end
