class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_login, only: [ :profile ]


  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    if User.exists?(email: params[:user][:email])
      redirect_to new_user_path(error: "email_taken") and return
    end

    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: "Account created successfully." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def profile
    # @user = User.find(params.expect(:id))
    @user = current_user
    puts "👉 current_user: #{current_user.inspect}"
    puts "🧪 current_user = #{current_user.inspect}"
    @my_posts = @user.meal_posts.order(created_at: :desc)
    @bookmarked_posts = MealPost.joins(:bookmarks).where(bookmarks: { user_id: @user.id }).order(created_at: :desc)
  end

def edit_password
  @user = current_user
end

# def update_password
#   @user = current_user
#   if @user.authenticate(params[:user][:current_password])
#     if params[:user][:new_password] == params[:user][:new_password_confirmation]
#       @user.password = params[:user][:new_password]
#       if @user.save
#         redirect_to profile_path, notice: "Password updated successfully."
#       else
#         flash.now[:alert] = "Failed to update password."
#         render :edit_password
#       end
#     else
#       flash.now[:alert] = "New passwords do not match."
#       render :edit_password
#     end
#   else
#     flash.now[:alert] = "Incorrect current password."
#     render :edit_password
#   end
# end
def update_password
  @user = current_user
  current = params[:current_password]
  new_pw = params[:new_password]
  confirm = params[:new_password_confirmation]

  if @user.authenticate(current)
    if new_pw == confirm
      @user.password = new_pw
      if @user.save
        flash[:notice] = "Password updated successfully."
        redirect_to profile_path
      else
        flash[:alert] = "Failed to save new password."
        render :change_password
      end
    else
      flash[:alert] = "New password and confirmation do not match."
      render :change_password
    end
  else
    flash[:alert] = "Current password is incorrect."
    render :change_password
  end
end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    # def user_params
    #   params.expect(user: [ :username, :email, :password_digest, :is_admin ])
    # end
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
