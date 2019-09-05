Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, only: [:create, :new, :destroy, :show]
resource :session, only: [:create, :new, :destroy]
resources :bands, only: [:index, :new, :create, :destroy, :show, :update, :edit] do
  resources :albums, only: [:new, :create]
end

resources :albums, only: [:show, :destroy, :update, :edit] do 
    resources :tracks, only: [:new, :create]
  end

resources :tracks, only: [:show, :update, :edit, :destroy] do
  resources :notes, only: [:create, :destroy, :update]
end
end
