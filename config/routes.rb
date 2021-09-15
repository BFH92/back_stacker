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

  post 'user/forgotten_password' => "users/password#forgot"
  post 'user/reset_password' => "users/password#reset"
  post 'company/forgotten_password' => "companies/password#forgot"
  post 'company/reset_password' => "companies/password#reset"
  
end
