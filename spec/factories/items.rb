FactoryBot.define do
  factory :item do
    title         { 'test商品名' }
    text          { 'test商品説明' }
    category_id   { 2 }
    status_id     { 2 }
    cost_id       { 2 }
    prefecture_id { 2 }
    response_id   { 2 }
    price         { 10_000 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
