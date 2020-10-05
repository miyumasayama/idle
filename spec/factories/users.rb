FactoryBot.define do
  #factory :user, aliases:[:owner] do #aliasesで別名ownerでも呼び出せる
    #provider {"github"}
    #sequence(:uid){|i| "uid#{i}"}
    #sequence(:email){|i| "email#{i}@gmail.com"}
    #sequence(:password){|i| "password#{i}"}
  #end

  factory :user do
    email                    {"mmm@gmail.com"}
    password                 {"00000000"}
    password_confirmation    {"00000000"}
  end
end
