FactoryBot.define do
  factory :user, class: User do
    sequence(:email) { |n| "test#{n}@example.com" }
    password {"aoko0618"}
  end

  factory :user2, class: User do
    email {'rikonakayama@gmail.com'}
    password {"kyuuri1028"}
  end
end
