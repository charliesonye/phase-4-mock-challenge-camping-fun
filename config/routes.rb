Rails.application.routes.draw do
  resources :activities, except: [:create, :show, :update]
  resources :signups, except: [:index, :show, :update, :destroy]
  resources :campers, except: [:update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
