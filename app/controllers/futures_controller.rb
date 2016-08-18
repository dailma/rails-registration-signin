class FuturesController < ApplicationController
	def index
		if !current_user
			flash[:log_errors] = ["Please sign in"]
			redirect_to users_new_path
		else
			@name = current_user.given_name
		end
	end
end
