class Product < ApplicationRecord
  has_one_attached :image do |att|
    att.variant :thumb, resize_to_limit: [100, 100]
    att.variant :big_thumb, resize_to_limit: [600, 700]
  end

  belongs_to :category

  validates :name, :description, :price, presence: true
end
