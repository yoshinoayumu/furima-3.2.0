class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image


  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price
  end

  validates_inclusion_of :price, in: 300..9999999


  extend ActiveHash::Associations::ActiveRecordExtensions

  # validates :title, :text, presence: true:, numericality: { other_than: 1 } 
  belongs_to :scheduled_delivery 
  belongs_to :shipping_fee_status 
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :category

  with_options presence: true, numericality: { other_than: 0 } do
    validates :category_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :sales_status_id
    validates :category_id
  end
end
