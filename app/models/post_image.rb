class PostImage < ApplicationRecord
  belongs_to :users, optional: true
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :image
  
  validates :introduction, presence: true
  validates :image, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def PostImage.search(search, user_or_post)
    if user_or_post == "2"
      PostImage.where(['introduction LIKE ?', "%#{search}%"])
    else
      PostImage.all
    end
  end

end
