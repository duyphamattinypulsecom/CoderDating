class SessionsController < ApplicationController

	def create
		@user = User.find_by(:email => params[:user][:email])

		if @user && @user.authenticate(params[:user][:password])
			redirect_to users_path
			session[:user_id] = @user.id
		else
			@user ||= User.new
			@user.errors.add(:base, "Invalid username or password")
			render 'new'
		end
	end

end
