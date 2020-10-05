FactoryBot.define do
  factory :comment do
    content { "MyString" }
    user { nil }
    tweet { nil }
  end
end
