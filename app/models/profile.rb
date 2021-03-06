class Profile < ApplicationRecord
  belongs_to :user
  validates :nickname, presence: true, length: {maximum:20}
  validates :favorite, presence: true
  validates :sex, presence: true
  validates :introduce, length: {maximum:1000}

  mount_uploader :image, ImageUploader

  scope :search, ->(search_params)do
    return if search_params.blank?

    nickname_like(search_params[:nickname_like])
      .favorite_like(search_params[:favorite_like])
      .what_sex_is(search_params[:what_sex_is])
      .age_from(search_params[:age_from])
      .age_to(search_params[:age_to])
  end


  scope :nickname_like, ->(nickname) { where('nickname LIKE ?', "%#{nickname}%") if nickname.present? }
  scope :favorite_like, ->(favorite) { where('favorite LIKE ?', "%#{favorite}%") if favorite.present? }
  scope :what_sex_is, ->(sex) { where(sex: sex) if sex.present? }
  scope :age_from, ->(from) { where('? <= age', from) if from.present? }
  scope :age_to, ->(to) { where('age <= ?', to) if to.present? }

  #scope :メソッド名 -> (引数) { SQL文 }
  #if 引数.present?をつけることで、検索フォームに値がない場合は実行されない
  enum place: {
    "---":0,
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }

  enum sex:{
    " ": 0,
    男性: 1,
    女性: 2,
    その他: 3
  }
end
