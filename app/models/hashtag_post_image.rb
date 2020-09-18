class HashtagPostImage < ApplicationRecord
  belongs_to :post_image
  belongs_to :hashtag
  varidates :post_image_id, presence: true
  varidates :hashtag_id, presence :true
end
