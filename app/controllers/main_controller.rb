class MainController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all
		@friendships = current_user.friendships
	end

end
