Rails.application.routes.draw do
  resources :kinds

  resources :contacts do
    resource :kind, only: [:show] # -> no singular para a action ir para show e não index(caso fosse no plural)
    resource :kind, only: [:show], path: 'relationships/kind'
  end

end
