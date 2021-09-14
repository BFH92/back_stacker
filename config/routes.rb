Rails.application.routes.draw do
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
  post 'forgotten_password' => "users/password#forgot"
  post 'reset_password' => "users/password#reset"
  
end
