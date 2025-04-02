class MealPost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  # Active Storage for image upload
  has_one_attached :image

  # Define enums; note the field names match migration (meal_type and meal_source)
  # enum meal_type: { breakfast: 0, lunch: 1, dinner: 2 }
  # enum meal_source: { homemade: 0, eating_out: 1 }
  enum :meal_type, { breakfast: 0, lunch: 1, dinner: 2 }, prefix: :meal
  enum :meal_source, { homemade: 0, eating_out: 1 }, prefix: :mealsource



  validates :title, presence: true
  validates :content, presence: true
end
