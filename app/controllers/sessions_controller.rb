# class SessionsController < ApplicationController
#   def new
#   end

#   def create
#   end

#   def destroy
#   end
# end
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully."
    else
      # flash.now[:alert] = "Invalid email or password."
      # render :new
      redirect_to login_path(error: "invalid")
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to logout_path, notice: "Logged out successfully."
  end
end
