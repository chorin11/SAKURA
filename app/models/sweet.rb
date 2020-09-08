class Sweet < ApplicationRecord
  has_many :genres, deoendent: :destroy
end
