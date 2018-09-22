Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  #root route (says what do I get for '/'?)
  root 'tasks#index'

  resources :tasks do
    member do
      patch :update_status
    end
  end

# patch '/tasks/:task_id/completion_date', to: 'tasks#update_status', as: 'task_update_status'

  #
  # get '/tasks', to: 'tasks#index', as: 'tasks'
  #
  # get '/tasks/new', to: 'tasks#new', as: 'new_task'
  #
  # post '/tasks', to: 'tasks#create'
  #
  # patch '/tasks/:id', to: 'tasks#update', as: 'update'
  #
  # patch '/tasks/:id', to: 'tasks#update_status', as: 'update_status'
  #
  #
  # get 'tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  #
  #
  # get '/tasks/:id', to: 'tasks#show', as: 'task'
  #
  #
  # delete '/tasks/:id', to: 'tasks#delete'





end
