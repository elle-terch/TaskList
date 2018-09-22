Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  #root route (says what do I get for '/'?)
  root 'tasks#index'

  resources :tasks do
    member do
      patch :update_status
    end
  end
end
