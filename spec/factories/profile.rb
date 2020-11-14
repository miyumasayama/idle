FactoryBot.define do

  factory :profile,class: Profile do   
    id {1}

    user_id{1}
    nickname { "有村架純" }
    age { 22 }
    favorite { "菅田将暉" }
    introduce { "test" }
    created_at { 2020-05-10 }
    updated_at { 2020-05-10 }
    sex { 1 }
  end

  factory :anotherprofile, class: Profile do
    user_id{2}
    nickname { "齊藤京子" }
    age { 22 }
    favorite { "菅田将暉" }
    introduce { "test" }
    created_at { 2020-05-10 }
    updated_at { 2020-05-10 }
    sex { 2 }
  end
end