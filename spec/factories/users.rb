FactoryBot.define do

  factory :user, class: User do
    id{ 1 }


    email {'rikawatanabe@gmail.com'}
    password {"aoko0618"}
  end

  factory :anotheruser,class: User do
    id {2}
    email {'rikownakayama@gmail.com'}
    password {"kyuuri1118"}
  end

  factory :user3, class: User do
    id{ 3 }
    email {'akitoyonaga@gmail.com'}
    password {"aki_1118"}
  end
end
