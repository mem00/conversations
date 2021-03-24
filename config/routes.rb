Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "conversations#index"
  
  resources :conversations, only: [:index, :show, :new, :create] do
    resources :messages, only: [:new, :create] do
      resources :thoughts, only: [:new, :create]
    end
  end
  
end
