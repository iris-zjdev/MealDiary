# class CommentsController < ApplicationController
#   before_action :set_comment, only: %i[ show edit update destroy ]

#   # GET /comments or /comments.json
#   def index
#     @comments = Comment.all
#   end

#   # GET /comments/1 or /comments/1.json
#   def show
#   end

#   # GET /comments/new
#   def new
#     @comment = Comment.new
#   end

#   # GET /comments/1/edit
#   def edit
#   end

#   # POST /comments or /comments.json
#   def create
#     @comment = Comment.new(comment_params)

#     respond_to do |format|
#       if @comment.save
#         format.html { redirect_to @comment, notice: "Comment was successfully created." }
#         format.json { render :show, status: :created, location: @comment }
#       else
#         format.html { render :new, status: :unprocessable_entity }
#         format.json { render json: @comment.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /comments/1 or /comments/1.json
#   def update
#     respond_to do |format|
#       if @comment.update(comment_params)
#         format.html { redirect_to @comment, notice: "Comment was successfully updated." }
#         format.json { render :show, status: :ok, location: @comment }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @comment.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /comments/1 or /comments/1.json
#   def destroy
#     @comment.destroy!

#     respond_to do |format|
#       format.html { redirect_to comments_path, status: :see_other, notice: "Comment was successfully destroyed." }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_comment
#       @comment = Comment.find(params.expect(:id))
#     end

#     # Only allow a list of trusted parameters through.
#     def comment_params
#       params.expect(comment: [ :content, :user_id, :meal_post_id ])
#     end
# end
class CommentsController < ApplicationController
  before_action :require_login

  def create
    @meal_post = MealPost.find(params[:meal_post_id])
    @comment = @meal_post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @meal_post, notice: "Comment added successfully."
    else
      redirect_to @meal_post, alert: "Error adding comment."
    end
  end

  def destroy
    @meal_post = MealPost.find(params[:meal_post_id])
    @comment = @meal_post.comments.find(params[:id])
    # Optional: Check if current_user is the comment owner or admin
    @comment.destroy
    redirect_to @meal_post, notice: "Comment deleted successfully."
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def require_login
    unless current_user
      redirect_to login_path, alert: "Please log in to continue."
    end
  end
end
