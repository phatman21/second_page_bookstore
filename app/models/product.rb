class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :name, :price, :stock_quantity, :category_id, presence: true
  validates :price, :stock_quantity, numericality: true

  belongs_to :category
end
