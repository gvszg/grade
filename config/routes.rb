Rails.application.routes.draw do
  root 'posts#index'

  resources :posts, only: [:index, :show]

  namespace :admin do
    resources :users, :posts
  end

  resources :years, only:[:index, :new, :create] do
    resources :students do
      resources :states do
        resources :results, except: [:show]
      end
    end
  end
end
