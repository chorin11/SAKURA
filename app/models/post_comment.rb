class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_image

  validates :post_comment, presence: true
  
end
