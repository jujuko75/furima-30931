FactoryBot.define do
  factory :item do
    name                  {"商品名"}
    text                  {"商品説明"}
    category_id           {Faker::Number.within(range: 2..11)}
    condition_id          {Faker::Number.within(range: 2..7)}
    postagetype_id        {Faker::Number.within(range: 2..3)}
    prefecture_id         {Faker::Number.within(range: 2..48)}
    deliveryday_id        {Faker::Number.within(range: 2..4)}
    price                 {Faker::Number.within(range: 300..9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/catcatcat.jpeg'), filename: 'catcatcat.jpeg')
    end
  end
end