class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable,
      :validatable, password_length: 7..20
  validates :nickname, :first_name_kana,:family_name_kana,:first_name,:family_name,presence: true
  validates :email, uniqueness: true
  validates :first_name_kana, :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name, :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  
  has_many :products, dependent: :destroy
  has_one :destination, dependent: :destroy
  has_one :card, dependent: :destroy

end
