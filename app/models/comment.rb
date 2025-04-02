class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :meal_post

  validates :content, presence: true
end
