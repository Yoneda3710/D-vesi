class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, :family_name, :first_name, :kana_family_name, :kana_first_name, :birthday , presence: true
  has_one :card, dependent: :destroy
  has_one :address
end
