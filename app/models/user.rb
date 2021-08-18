# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2] # google認証

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|

      # user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end


  has_many :recipes, dependent: :destroy
  has_many :daily_menus, dependent: :destroy
  has_many :shopping_lists, dependent: :destroy
  has_many :contacts, dependent: :destroy

  validates :name,  presence: true
  validates :email, presence: true, uniqueness: true
end
