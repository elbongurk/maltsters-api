Rails.application.routes.draw do
  resources :maltsters, only: [:index, :show]
  resources :malts, only: :show
  resources :lots, only: :show
end
