json.extract! meal_post, :id, :title, :content, :meal_type, :meal_source, :user_id, :created_at, :updated_at
json.url meal_post_url(meal_post, format: :json)
