Rails.application.routes.draw do
 

  root 'posts#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :posts, only: [:index, :show]

  resources :years, only:[:index, :new, :create] do
    resources :students do
      resources :states do
        resources :results, except: [:show]
      end
    end
  end

   namespace :admin do
    resources :users, :posts
  end
end
