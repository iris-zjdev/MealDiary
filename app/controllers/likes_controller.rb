# class LikesController < ApplicationController
#   def create
#   end

#   def destroy
#   end
# end
class LikesController < ApplicationController
  before_action :require_login

  def create
    @meal_post = MealPost.find(params[:meal_post_id] || params[:meal_post])
    @like = @meal_post.likes.build(user: current_user)
    if @like.save
      redirect_to @meal_post, notice: "Liked the meal post."
    else
      redirect_to @meal_post, alert: "Error liking the meal post."
    end
  end

  def destroy
    @meal_post = MealPost.find(params[:meal_post_id] || params[:meal_post])
    @like = @meal_post.likes.find_by(user: current_user)
    @like.destroy if @like
    redirect_to @meal_post, notice: "Unliked the meal post."
  end

  private

  def require_login
    unless current_user
      redirect_to login_path, alert: "Please log in."
    end
  end
end
