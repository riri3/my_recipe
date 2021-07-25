Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'how_to_use' => 'homes#how_to_use'

  resources :users, only: [:show, :edit, :update]
  resources :recipes
  resources :daily_menus, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :weekly_menus, only: [:index]
  resources :shopping_lists, only:[:index, :create, :edit, :update, :destroy]
  post 'contacts/confirm' => 'contacts#confirm'
  post 'contacts/back', to: 'contacts#back'
  get 'thanx' => 'contacts#thanx'
  resources :contacts, only: [:index, :create]

end
