Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "busca-pokemon/:pokemon_name", to: "pokes#busca"
  get "busca-pokemon/", to: "pokes#no_valid"
  resources :pokes do
  end
end
