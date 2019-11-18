Rails.application.routes.draw do
  
  root 'application#home'
  
  devise_for :users
  devise_for :customers

  namespace :cms do
    root to: "dashboard#index"
    post '/upload-image/:news_id', to:'photos#upload_image'
    post '/sort-image', to:'photos#sort_image'
    resources :users, :item_categories, :items, :photos
  end

  namespace :api do
    resources :users, :item_categories, :items, :photos
  end

end
