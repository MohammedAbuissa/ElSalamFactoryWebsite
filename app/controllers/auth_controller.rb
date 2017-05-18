require 'digest/sha1'

class AuthController < ApplicationController
	#get /signin
	def signin_view
	end

	#post /signin
	def signin
		email = params[:email]
		password = params[:password]
		hashed_password = hash_password password

		@user = User.find_by email: email
		if @user && hashed_password == @user.password
			session[:current_user_id] = @user.id
			redirect_to profile_url
		else
			flash[:error] = "username or password is wrong"
			redirect_to signin_url
		end
	end

	#get /signup
	def signup_view
		@user = User.new
	end

	#post /signup
	def signup
		@user = User.new user_params
		respond_to do |format|
	      if @user.save
	      	session[:current_user_id] = @user.id
	        format.html { redirect_to profile_url, notice: 'Article was successfully created.' }
	        format.json { render :show, status: :created, location: @user }
	      else
	        format.html { render :signup_view }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def profile
		user_id = session[:current_user_id]
		@user = User.find(user_id)
		if not @user
			redirect_to signin_url
		end
	end

private
	def user_params
		bad_user_params = params.require :user
		permit_params = bad_user_params.permit(:name, :email, :password)
		permit_params[:password] = hash_password permit_params[:password]
		permit_params
	end

	def hash_password password
		Digest::SHA1.hexdigest password
	end
end
