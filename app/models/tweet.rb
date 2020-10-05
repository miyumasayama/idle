class Tweet < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: {maximum:30}
    validates :text, presence: true, length:{maximum: 1000}
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    def self.search(search)
        if search
            Tweet.where(['title LIKE ? OR text LIKE ?', "%#{search}%", "%#{search}%"])
        else
            Tweet.all
        end
    end
end