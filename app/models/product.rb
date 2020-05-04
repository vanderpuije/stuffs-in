class Product < ApplicationRecord

	belongs_to :seller
	has_many :product_categories
	has_many :categories, through: :product_categories

	validates :name, presence: true, length: {minimum: 3, maximum: 50}
	validates :description, presence: true, length: {minimum: 10, maximum: 300}
	validates :price, presence: true
	validates :seller_id, presence: true

	
	
	
end
