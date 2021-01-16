FactoryBot.define do
  factory :item do
    name                  {Faker::String.random(length:40)}
    text                  {Faker::String.random(length:1000)}
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