class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all.shuffle
  end

  def create
  	@user = User.new(user_params)
    @user.image_url = "https://robohash.org/#{rand(100)}.png"

  	if @user.save
  		redirect_to users_path
  	else
  		render 'welcome/index'
  	end

  end

  private

  def user_params
      params.require(:user).permit(:email, :name, :image_url, :password)
  end
end
