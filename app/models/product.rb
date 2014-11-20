class Product < ActiveRecord::Base
  validates :name, :price, :stock_quantity, presence: true
  validates :price, :stock_quantity, numericality: true

  belongs_to :category
end
