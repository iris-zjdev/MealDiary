# class BookmarksController < ApplicationController
#   def create
#   end

#   def destroy
#   end
# end
class BookmarksController < ApplicationController
  before_action :require_login

  # Create a new bookmark for a meal post
  def create
    # Retrieve the meal_post id from params (supporting both :meal_post_id and :meal_post)
    meal_post_id = params[:meal_post_id] || params[:meal_post]
    @meal_post = MealPost.find(meal_post_id)

    # Check if the bookmark already exists to prevent duplicates
    existing_bookmark = Bookmark.find_by(user: current_user, meal_post: @meal_post)
    if existing_bookmark
      redirect_to @meal_post, notice: "Bookmark already exists."
    else
      @bookmark = current_user.bookmarks.build(meal_post: @meal_post)
      if @bookmark.save
        redirect_to @meal_post, notice: "Bookmark added successfully."
      else
        redirect_to @meal_post, alert: "Error adding bookmark."
      end
    end
  end

  # Destroy (remove) an existing bookmark for a meal post
  def destroy
    meal_post_id = params[:meal_post_id] || params[:meal_post]
    @meal_post = MealPost.find(meal_post_id)
    @bookmark = Bookmark.find_by(user: current_user, meal_post: @meal_post)
    if @bookmark
      @bookmark.destroy
      redirect_to @meal_post, notice: "Bookmark removed successfully."
    else
      redirect_to @meal_post, alert: "Bookmark not found."
    end
  end

  private

  # Ensure the user is logged in before performing any actions
  def require_login
    unless current_user
      redirect_to login_path, alert: "Please log in to continue."
    end
  end
end
