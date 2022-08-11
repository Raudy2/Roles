class Post < ApplicationRecord
  has_one_attached :images

  validates :title, presence: true
end
