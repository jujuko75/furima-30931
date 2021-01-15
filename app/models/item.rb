class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one    :purchase
  belongs_to :category
  belongs_to :condition
  belongs_to :postagetype
  belongs_to :prefecture
  belongs_to :deliverydays
  has_one_attached :image
  

  with_options presence: true do
    validates :name,          length: { maximum: 40 }
    validates :text,          length: { maximum: 1000 }
    validates :category,      numericality: { other_than: 1}
    validates :condition,     numericality: { other_than: 1}
    validates :postagetype,   numericality: { other_than: 1}
    validates :prefecture,    numericality: { other_than: 1}
    validates :deliverydays,  numericality: { other_than: 1}
    validates :price,         numericality: { greater_than: 299, less_than: 10000000 }
  end

end
