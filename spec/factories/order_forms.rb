FactoryBot.define do
  factory :order_form do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '品川区' }
    block { '南品川1-1' }
    building { '東京ハイツ' }
    tel { '09000000000' }
    
  end
end
