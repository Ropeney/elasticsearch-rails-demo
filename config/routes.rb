Rails.application.routes.draw do
  root 'search#index'
  resource :search, only: :index
end
