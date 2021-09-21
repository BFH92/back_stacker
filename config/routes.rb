Rails.application.routes.draw do
  resources :favorites_companies
  devise_for :companies,
  controllers: {
      sessions: 'companies/sessions',
      registrations: 'companies/registrations'
  }  
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users
  resources :companies
  resources :stacks
  resources :users_stack
  resources :companies_stack
  resources :favorites_companies
  
  post 'user/forgotten_password' => "users/password#forgot"
  post 'user/reset_password' => "users/password#reset"
  post 'company/forgotten_password' => "companies/password#forgot"
  post 'company/reset_password' => "companies/password#reset"
  get 'specific_user_stack_id' => "users_stack#get_id"
  get 'specific_company_stack_id' => "companies_stack#get_id"
  get 'favorite_id' => "favorites_companies#get_favorite"
end
