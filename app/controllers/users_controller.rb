class UsersController < ApplicationController
  before_action :authenticate_user
  before_action :find_user, only: [:show, :destroy]

  def show
    if @user
      render :show
    elsif @user.nil? 
      render json: { "error":"User not found" }, status: 422
    end
  end
 
   def create
    @user = User.new(user_params)
    if @user.save
      @token = Knock::AuthToken.new(payload: { sub: @user.id }).token
      render :show
    else
      render :errors, status: 422
    end
  end
 
  def destory
    if @user && @user.destroy
      render status: 200
    else
      render :errors, status: 422
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
