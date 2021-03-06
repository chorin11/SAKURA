class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :following, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  attachment :profile_image

  # フォロー機能
  def following?(user)
    following_relationships.find_by(following_id: user.id)
  end

  def follow(user)
    following_relationships.create!(following_id: user.id)
  end

  def unfollow(user)
    following_relationships.find_by(following_id: user.id).destroy
  end
  # フォロー機能

  # いいね機能
  def already_favorited?(post_image)
    self.favorites.exists?(post_image_id: post_image.id)
  end
  # いいね機能

  # 検索機能
  def User.search(search, user_or_post)
    if user_or_post == "1"
      User.where(['name LIKE ?', "%#{search}%"])
    else
      User.all
    end
  end
  # 検索機能

  # ユーザー退会
    # def active_for_authentication?
    #   self.is_delete == false
    # end
  
    # def inactive_message
    #   "このアカウントは退会されています。"
    # end
  # ユーザー退会
end
