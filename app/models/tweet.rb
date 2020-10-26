class Tweet < ApplicationRecord
    belongs_to :user

    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    validates :title, presence: true, length: {maximum:30}
    validates :text, presence: true, length:{maximum: 1000}

    def self.search(search)
        if search
            Tweet.where(['title LIKE ? OR text LIKE ?', "%#{search}%", "%#{search}%"])
        else
            Tweet.all
        end
    end

    def is_liked?(user_id)
        likes.find_by(user_id: user_id)
    end
end