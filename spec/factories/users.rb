FactoryBot.define do
  factory :user do
    factory :user do
      nickname              { Faker::Name.name }
      email                 { Faker::Internet.unique.email }
      password              { '123ab' + Faker::Internet.unique.password(min_length: 6) }
      password_confirmation { password }
      last_name             { "藤田" }
      first_name            { "崇嗣" }
      last_name_kana        { "フジタ" }
      first_name_kana       { "タカシ" }
      birthday              { Faker::Date.birthday }
  end
end