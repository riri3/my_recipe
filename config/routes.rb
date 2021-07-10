Rails.application.routes.draw do

  get 'contacts/new'
  get 'users/show'

  get 'users/edit'

  get 'shopping_lists/index'

  get 'weekly_menus/index'

  devise_for :users
  root to: 'homes#top'
  get 'how_to_use' => 'homes#how_to_use'

  resources :users, only: [:show, :edit, :update]
  resources :recipes
  resources :daily_menus, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :weekly_menus, only: [:index]
  resources :shopping_lists, only:[:index, :create, :edit, :update, :destroy]
  resources :contacts, only:[:new, :create]


end
