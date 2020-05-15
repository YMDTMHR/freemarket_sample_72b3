class Destination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :prefecture

  # belongs_to_active_hash :prefecture
  # delegate :name, to: :prefecture
  
  validates :family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :city, :address, presence: true
  validates :first_name, :family_name, :city, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :post_code, format:{with: /\A\d{3}[-]\d{4}\z/}
  # validates :phone_number, format:{with: /\A\d{11}\z/}



  

end
