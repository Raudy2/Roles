class Post < ApplicationRecord
  has_one_attached :images
  belongs_to :author,  class_name: 'User'

  validates :title, presence: true
end
