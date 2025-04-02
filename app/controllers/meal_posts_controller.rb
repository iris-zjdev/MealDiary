class MealPostsController < ApplicationController
  before_action :set_meal_post, only: %i[ show edit update destroy ]

  # GET /meal_posts or /meal_posts.json
  def index
    @meal_posts = MealPost.all
  end

  # GET /meal_posts/1 or /meal_posts/1.json
  def show
  end

  # GET /meal_posts/new
  def new
    @meal_post = MealPost.new
  end

  # GET /meal_posts/1/edit
  def edit
  end

  # POST /meal_posts or /meal_posts.json
  def create
    @meal_post = MealPost.new(meal_post_params)

    respond_to do |format|
      if @meal_post.save
        format.html { redirect_to @meal_post, notice: "Meal post was successfully created." }
        format.json { render :show, status: :created, location: @meal_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meal_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meal_posts/1 or /meal_posts/1.json
  def update
    respond_to do |format|
      if @meal_post.update(meal_post_params)
        format.html { redirect_to @meal_post, notice: "Meal post was successfully updated." }
        format.json { render :show, status: :ok, location: @meal_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meal_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_posts/1 or /meal_posts/1.json
  def destroy
    @meal_post.destroy!

    respond_to do |format|
      format.html { redirect_to meal_posts_path, status: :see_other, notice: "Meal post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_post
      @meal_post = MealPost.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def meal_post_params
      params.expect(meal_post: [ :title, :content, :meal_type, :meal_source, :user_id ])
    end
end
