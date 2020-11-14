FactoryBot.define do
  factory :tweet, class: Tweet do
    id {1}
    user_id{1}
    title{"ai"}
    text{"aiai"}
  end

  factory :tweet2, class: Tweet do
    id {2}
    user_id{1}
    title{"HI"}
    text{"こんにちは"}
  end
end
