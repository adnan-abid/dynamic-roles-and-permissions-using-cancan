Rails.application.routes.draw do
  get 'traveler_plans/index'

  get 'traveler_plans/show'

  get 'traveler_plans/new'

  get 'traveler_plans/create'

  get 'traveler_plans/edit'

  get 'traveler_plans/update'

  get 'traveler_plans/destory'

  get 'mailboxes/mailbox', :as => 'mailboxes'

  get 'mailboxes/compose', :as => 'mailboxes_compose'

  get 'mailboxes/readmail', :as => 'mailboxes_readmail'

  get 'mailboxes/destory'

  #get 'agents/dashboard', :as => 'agent_root'
  #get 'travelers/dashboard', :as => 'traveler_path'
  get 'agents/dashboard', :as => 'agentDashboard'
  get 'agents/profile', :as => 'agent_profile'
  
  get 'travelers/dashboard', :as => 'traveler_dashboard'
  get 'traveler_plans/new', :as => 'create_plan'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  get "home/erroracces", :as => 'erroracces'
  
  resources :drawings
  resources :parts

  devise_for :users
  resources :users
  resources :roles
  resources :permissions
  resources :travelers
  resources :agents
  resources :traveler_plans


end
