class Sweet < ApplicationRecord
  has_many :genres, dependent: :destroy
end
