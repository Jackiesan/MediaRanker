Rails.application.routes.draw do
  root 'works#main'
  resources :works
end
