FactoryBot.define do
  factory :order_address do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    city          { 'テスト市' }
    address       { 'テスト１−１' }
    building      { 'テストビル' }
    phone_number  { '08012345678' }
  end
end
