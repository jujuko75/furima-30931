class Buyerinfo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :token
  belongs_to :prefecture
  has_one :order
  has_one :item, through: :order
  

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1}
    validates :city
    validates :house_number
    validates :phone_number,format: {with: /\A\d{10,11}\z/}
    validates :token
  end
end
