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
# User.destroy_all
# MealPost.destroy_all
# Comment.destroy_all
# Like.destroy_all
# Bookmark.destroy_all

# # Create users (password is "password")
# user1 = User.create!(username: "admin", email: "admin@example.com", password: "password", is_admin: true)
# user2 = User.create!(username: "alice", email: "alice@example.com", password: "password", is_admin: false)
# user3 = User.create!(username: "bob", email: "bob@example.com", password: "password", is_admin: false)

# # Create meal posts with enum values (using new Rails 8 syntax)
# post1 = MealPost.create!(
#   title: "Breakfast: Fried Egg Toast",
#   content: "Today's breakfast is simple: fried egg toast with a glass of milk.",
#   meal_type: :breakfast,
#   meal_source: :homemade,
#   user: user2
# )

# post2 = MealPost.create!(
#   title: "Lunch: Mixed Vegetable Salad",
#   content: "A healthy and refreshing lunch: a homemade vegetable salad.",
#   meal_type: :lunch,
#   meal_source: :homemade,
#   user: user3
# )

# post3 = MealPost.create!(
#   title: "Dinner: Hotpot",
#   content: "Had a lively hotpot dinner with friends. It was warm and fun.",
#   meal_type: :dinner,
#   meal_source: :eating_out,
#   user: user2
# )

# # Optionally attach an image if a sample image file is available locally
# # post1.image.attach(io: File.open(Rails.root.join("db", "sample.jpg")), filename: "sample.jpg", content_type: "image/jpeg")

# # Create comments for meal posts
# Comment.create!(content: "Looks delicious!", user: user3, meal_post: post1)
# Comment.create!(content: "I would love to try this recipe.", user: user1, meal_post: post1)
# Comment.create!(content: "Salad is indeed a healthy choice.", user: user2, meal_post: post2)

# # Create likes (each like associates a user with a meal post)
# Like.create!(user: user1, meal_post: post1)
# Like.create!(user: user3, meal_post: post1)
# Like.create!(user: user2, meal_post: post2)

# # Create bookmarks (each bookmark associates a user with a meal post)
# Bookmark.create!(user: user1, meal_post: post3)
# Bookmark.create!(user: user3, meal_post: post2)
# Create Users
User.destroy_all
MealPost.destroy_all
Comment.destroy_all
Like.destroy_all
Bookmark.destroy_all

user1 = User.create!(username: "Lee", email: "lee@example.com", password: "password123")
user2= User.create!(username: "Iris", email: "iris@example.com", password: "password123")
user3= User.create!(username: "Vivian", email: "vivian@example.com", password: "password123")
user4= User.create!(username: "Myles", email: "myles@example.com", password: "password123")
user5= User.create!(username: "Shirley", email: "shirley@example.com", password: "password123")
user6= User.create!(username: "Zhang", email: "zhang@example.com", password: "password123")

# Create MealPosts with Images
file1 = File.open(Rails.root.join("db/seed_images", "eating out breakfast pho.jpg"))
post1 = MealPost.create!(
  title: "Breakfast - Pho",
  content: "This is a lovely breakfast featuring pho. It's flavorful, comforting, and exactly what you need to start the day right!",
  meal_type: :breakfast,
  meal_source: :eating_out,
  user: user1
)
post1.image.attach(io: file1, filename: "eating out breakfast pho.jpg", content_type: "image/jpeg")

file2 = File.open(Rails.root.join("db/seed_images", "eating out dinner sushi.jpg"))
post2 = MealPost.create!(
  title: "Dinner - Sushi",
  content: "A delightful dinner with sushi. Perfectly hits the spot after a long day!",
  meal_type: :dinner,
  meal_source: :eating_out,
  user: user4
)
post2.image.attach(io: file2, filename: "eating out dinner sushi.jpg", content_type: "image/jpeg")

file3 = File.open(Rails.root.join("db/seed_images", "eating out lunch hamburgers.jpg"))
post3 = MealPost.create!(
  title: "Lunch - Hamburgers",
  content: "Another beautiful day but same hamburgers. I really like them.",
  meal_type: :lunch,
  meal_source: :eating_out,
  user: user2
)
post3.image.attach(io: file3, filename: "eating out lunch hamburgers.jpg", content_type: "image/jpeg")

file4 = File.open(Rails.root.join("db/seed_images", "homemade breakfast noodles.jpg"))
post4 = MealPost.create!(
  title: "Breakfast - Noodles",
  content: "Noodles as breakfast. Always my first choice. Do you like them?",
  meal_type: :breakfast,
  meal_source: :homemade,
  user: user2
)
post4.image.attach(io: file4, filename: "homemade breakfast noodles.jpg", content_type: "image/jpeg")

file5 = File.open(Rails.root.join("db/seed_images", "homemade dinner pie.jpg"))
post5 = MealPost.create!(
  title: "Dinner - Blueberry pie",
  content: "Our family enjoyed a delightful dinner with this homemade blueberry pie. So Sweety!",
  meal_type: :dinner,
  meal_source: :homemade,
  user: user6
)
post5.image.attach(io: file5, filename: "homemade dinner pie.jpg", content_type: "image/jpeg")

file6 = File.open(Rails.root.join("db/seed_images", "homemade lunch pasta.jpg"))
post6 = MealPost.create!(
  title: "Lunch - Pasta",
  content: "Today's lunch was pasta, quick and satisfying to power through the afternoon.",
  meal_type: :lunch,
  meal_source: :homemade,
  user: user5
)
post6.image.attach(io: file6, filename: "homemade lunch pasta.jpg", content_type: "image/jpeg")


# Create MealPosts without Images

post7 = MealPost.create!(
  title: "Omakase",
  content: "Omakase is the art of randomness! Hope to try again.",
  meal_type: :dinner,
  meal_source: :eating_out,
  user: user3
)

# Random Likes, Bookmarks and Comments
Comment.create!(content: "Looks delicious!", user: user2, meal_post: post4)
Comment.create!(content: "Love this kind of meal.", user: user1, meal_post: post3)
Comment.create!(content: "This is indeed a good choice.", user: user3, meal_post: post7)
Comment.create!(content: "I want to try this next week.", user: user4, meal_post: post6)
Comment.create!(content: "Reminds me of home cooking.", user: user6, meal_post: post6)
Comment.create!(content: "That looks amazing!", user: user5, meal_post: post5)
Like.create!(user: user1, meal_post: post6)
Like.create!(user: user2, meal_post: post5)
Like.create!(user: user3, meal_post: post7)
Like.create!(user: user4, meal_post: post3)
Like.create!(user: user1, meal_post: post4)
Bookmark.create!(user: user1, meal_post: post3)
Bookmark.create!(user: user4, meal_post: post2)
Bookmark.create!(user: user3, meal_post: post5)
Bookmark.create!(user: user5, meal_post: post6)
