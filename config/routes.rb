Rails.application.routes.draw do
devise_for :users
resources :users, only: [:show]
resources :tweets do
    resources :likes, only: [:create, :destroy]
end
get 'hello/index' => 'hello#index'
get 'tweets/:tweet_id/likes' => 'likes#create'
get 'tweets/:tweet_id/likes/:id' => 'likes#destroy'
root 'hello#index'
resources :perfumes
end