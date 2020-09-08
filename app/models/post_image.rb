class PostImage < ApplicationRecord
  attachment :image
  belongs_to :users
  has_many :post_comments, depenent: :destroy
  has_many :favorites, depenent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
