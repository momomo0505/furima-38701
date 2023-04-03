FactoryBot.define do
  factory :order_form do
    user_id { 1 }
    item_id { 1 }
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '品川区' }
    block { '南品川1-1' }
    building { '東京ハイツ' }
    tel { '09000000000' }
    
  end
end
