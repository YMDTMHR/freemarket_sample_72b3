class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  # belongs_to :destination
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name, :price, :description, :status, :shipping_cost, :shipping_days, :prefecture_id, :category_id, presence: true
  validates_associated :images
  validates :images, presence: true
end
