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

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
