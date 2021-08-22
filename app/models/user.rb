# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2] # google認証


  has_many :recipes, dependent: :destroy
  has_many :daily_menus, dependent: :destroy
  has_many :shopping_lists, dependent: :destroy
  has_many :contacts, dependent: :destroy

  validates :name,  presence: true
  validates :email, presence: true, uniqueness: true

end
