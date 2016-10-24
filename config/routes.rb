Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Notes as resources
  resources :notes
  # Tags as resources
  resources :tags
end
