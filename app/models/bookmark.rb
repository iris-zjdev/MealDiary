class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :meal_post

  validates :user_id, uniqueness: { scope: :meal_post_id }
end
