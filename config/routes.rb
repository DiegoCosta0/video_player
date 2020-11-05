Rails.application.routes.draw do
  devise_for :users
  get 'page/home'
  get 'page/video/id'

  resources :videos do
    post 'count_views'
  end

  root 'page#home'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
