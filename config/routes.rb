# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'how_to_use' => 'homes#how_to_use'

  resources :users, only: %i(show edit update)
  resources :recipes
  resources :daily_menus, only: %i(index create show edit update destroy)
  resources :weekly_menus, only: [:index]
  resources :shopping_lists, only: %i(index create destroy)
  post 'contacts/confirm' => 'contacts#confirm'
  post 'contacts/back' => 'contacts#back'
  get 'thanx' => 'contacts#thanx'
  resources :contacts, only: %i(index create)
end
