class Buyerinfo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  #belongs_to :purchase

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1}
    validates :city
    validates :house_number
    validates :phone_number,format: {with: /\A\d{10,11}\z/}
  end
end
