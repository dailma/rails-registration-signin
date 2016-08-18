class UsersController < ApplicationController
	def new
		if current_user
			flash[:errors] = ["You're already signed in as #{current_user.full_name}"]
			redirect_to futures_path
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
		user = User.new(user_params)
		if user.invalid?
			flash[:reg_errors] = []
			user.errors.each do |attr, msg|
				case attr  # modifies errors from SecurePassword
				when :password
					flash[:reg_errors] << "Password #{msg}" if msg != "can't be blank"
				when :password_confirmation
					flash[:reg_errors] << "Password and password confirmation don't match"
				else
					flash[:reg_errors] << msg
				end
			end
			redirect_to users_new_path
		else
			user.save
			session[:user_id] = user.id
			session[:full_name] = user.full_name
			flash[:success] = "Your account is ready for use"
			redirect_to futures_path
		end
	end

	def update
		user = User.find(params[:id])
		user.given_name = user_params[:given_name]
		user.surname = user_params[:surname]
		user.email = user_params[:email]
		user.location = user_params[:location]
		user.region = user_params[:region]
		if user.invalid?
			flash[:errors] = user.errors.full_messages
			redirect_to url_for(:controller => :users, :action => :edit, :id => current_user.id)
		else
			user.save
			flash[:success] = "Profile information updated"
			redirect_to url_for(:controller => :users, :action => :show, :id => user.id)
		end
	end

	def destroy
		user = User.find(params[:id])
		if !user
			flash[:errors] = ["Something went wrong. Just to be safe, your account remains unchanged"]
			redirect_to url_for(:controller => :users, :action => :edit, :id => current_user.id)
		else
			user.destroy
			flash[:reg_success] = "Your account is now deleted"
			session[:user_id] = nil
			session[:full_name] = nil
			redirect_to users_new_path
		end
	end

	private
	def user_params
		params.require(:user).permit(:given_name, :surname, :email, :location, :region, :password, :password_confirmation)
	end
end
