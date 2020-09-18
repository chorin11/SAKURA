class PostImage < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :hashtag_post_images, dependent: :destroy
  has_many :hashtags, through: :hashtag_post_images

  attachment :image
  
  validates :introduction, presence: true
  validates :image, presence: true

  # 検索機能
  def PostImage.search(search, user_or_post)
    if user_or_post == "2"
      PostImage.where(['introduction LIKE ?', "%#{search}%"])
    else
      PostImage.all
    end
  end
  # 検索機能

  # タグ付け機能
  after_create do
    post_image = PostImage.find_by(id: id)
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.douncase.delete('#'))
      post_image.hashtags << tag
    end
  end
  # 更新アクション
  before_update do
    post_image = PostImage.find_by(id: id)
    post_image.hashtags.clear
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.douncase.delete('#'))
      PostImage.hashtags << tag
    end
  end
  # タグ付け機能

end
