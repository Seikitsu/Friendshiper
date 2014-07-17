class FriendshipController < ApplicationController
	def create
		@friendship = current_user.friendships.build(params[:friendship])
		if @friendship.save
		  flash[:success] = "You sent friend request!"
		  redirect_to root_url
		else
		  flash[:error] = "Fatal error"
		end
	end

	def update
		@friendship = Friendship.find(params[:id])
		if @friendship.update_attributes(params[:friendship])
			flash[:success] = "You are now friends!"
			redirect_to root_url
		else
			flash[:error] = "Fatal error"
		end
	end

	def destroy
		Friendship.find(params[:id]).destroy
		flash[:success] = "You are not friends anymore!"
		redirect_to root_url
	end
end
