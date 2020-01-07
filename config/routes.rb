Rails.application.routes.draw do
  get 'addresses/show'
  resources :kinds

  resources :contacts do
    resource :kind, only: [:show] # -> no singular para a action ir para show e não index(caso fosse no plural)
    resource :kind, only: [:show], path: 'relationships/kind'
    resource :phones, only: [:show] # -> no singular para a action ir para show e não index(caso fosse no plural)
    resource :phones, only: [:show], path: 'relationships/phones'
    resource :address, only: [:show]
    resource :address, only: [:show], path: 'relationships/address'
  end

end
