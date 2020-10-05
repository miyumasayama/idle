class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  validates_uniqueness_of :tweet_id, scope: :user_id #一つの投稿に1人のユーザーは１いいねまで
end
