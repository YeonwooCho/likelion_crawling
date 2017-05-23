Rails.application.routes.draw do
  resources :articles
  get 'articles/index'
  root 'articles#index'
  post 'articles/news_title'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end