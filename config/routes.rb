Rails.application.routes.draw do
  resources :queries
  get 'populations', to: 'populations#index'
  get 'the_logz', to: 'queries#index'
end
