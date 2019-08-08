Rails.application.routes.draw do
  get 'plant_tags/new'
  get 'plant_tags/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :gardens do
    resources :plants, only: [:new, :create]
  end

  resources :plants, only: [:destroy, :show]

  resources :plants, only: [] do
      resources :plant_tags, only: [:new, :create]
  end

  resources :plant_tags, only: [:destroy]
end
