class ApplicationController < ActionController::Base
	protect_from_forgery :with => :exception
	helper_method :current_user, :regions_us_cn

  	def current_user
		User.find(session[:user_id]) if session[:user_id]
	end

	def regions_us_cn
		codes = "ALAKAZARCACOCTDEDCFLGAHIIDILINIAKSKYLAMEMDMAMIMNMSMOMTNENVNHNJNMNYNCNDOHOKORPARISCSDTNTXUTVTVAWAWVWIWY--ABBCMBNBNLNSNTNUONPEQCSKYT"
		regions = []
		(0..(codes.length / 2) - 1).each do |idx|
			regions.append(codes[idx * 2, 2])
		end
		return regions
	end
end
