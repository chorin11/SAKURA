class PostImage < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :image
  
  validates :introduction, presence: true
  validates :image, presence: true

  def PostImage.search(search, user_or_post)
    if user_or_post == "2"
      PostImage.where(['introduction LIKE ?', "%#{search}%"])
    else
      PostImage.all
    end
  end

end
