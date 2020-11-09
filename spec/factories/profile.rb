FactoryBot.define do
  factory :profile do    
    user_id{1}
    nickname { "有村架純" }
    age { 22 }
    favorite { "菅田将暉" }
    introduce { "test" }
    created_at { 2020-05-10 }
    updated_at { 2020-05-10 }
    sex { 1 }
  end
end