# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing records to avoid duplication
User.destroy_all
MealPost.destroy_all
Comment.destroy_all
Like.destroy_all
Bookmark.destroy_all

# Create users (password is "password")
user1 = User.create!(username: "admin", email: "admin@example.com", password: "password", is_admin: true)
user2 = User.create!(username: "alice", email: "alice@example.com", password: "password", is_admin: false)
user3 = User.create!(username: "bob", email: "bob@example.com", password: "password", is_admin: false)

# Create meal posts with enum values (using new Rails 8 syntax)
post1 = MealPost.create!(
  title: "Breakfast: Fried Egg Toast",
  content: "Today's breakfast is simple: fried egg toast with a glass of milk.",
  meal_type: :breakfast,
  meal_source: :homemade,
  user: user2
)

post2 = MealPost.create!(
  title: "Lunch: Mixed Vegetable Salad",
  content: "A healthy and refreshing lunch: a homemade vegetable salad.",
  meal_type: :lunch,
  meal_source: :homemade,
  user: user3
)

post3 = MealPost.create!(
  title: "Dinner: Hotpot",
  content: "Had a lively hotpot dinner with friends. It was warm and fun.",
  meal_type: :dinner,
  meal_source: :eating_out,
  user: user2
)

# Optionally attach an image if a sample image file is available locally
# post1.image.attach(io: File.open(Rails.root.join("db", "sample.jpg")), filename: "sample.jpg", content_type: "image/jpeg")

# Create comments for meal posts
Comment.create!(content: "Looks delicious!", user: user3, meal_post: post1)
Comment.create!(content: "I would love to try this recipe.", user: user1, meal_post: post1)
Comment.create!(content: "Salad is indeed a healthy choice.", user: user2, meal_post: post2)

# Create likes (each like associates a user with a meal post)
Like.create!(user: user1, meal_post: post1)
Like.create!(user: user3, meal_post: post1)
Like.create!(user: user2, meal_post: post2)

# Create bookmarks (each bookmark associates a user with a meal post)
Bookmark.create!(user: user1, meal_post: post3)
Bookmark.create!(user: user3, meal_post: post2)
