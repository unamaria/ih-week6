Rails.application.routes.draw do
  
  # resources :users, only: [:show]
  resources :users, except: [:new, :edit] do
  	resources :tasks, except: [:index, :new, :edit]
  end
end
