Rails.application.routes.draw do
  root 'posts#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :posts do
    member do
      post 'check'
    end
  end

  resources :users

  resources :years, only:[:index, :new, :create] do
    resources :students do
      resources :states do
        resources :results, except: [:show]
      end
    end
  end
end
