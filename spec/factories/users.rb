FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'abc123' }
    password_confirmation { password }
    birthday              { Faker::Date.backward }
    first_name            { '名前' }
    last_name             { '苗字' }
    first_name_kana       { 'ナマエ' }
    last_name_kana        { 'ミョウジ' }
  end
end
