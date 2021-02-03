FactoryBot.define do
  factory :user do
    nickname {Faker::Internet.username }
    password { '1a' + Faker::Internet.password(min_length: 7, max_length: 20) }
    email {Faker::Internet.email}
    birth_date {Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today)}
    first_name { '歩' }
    last_name { '吉野'}
    first_name_kana { 'アユム' }
    last_name_kana { 'ヨシノ' }
  end
end