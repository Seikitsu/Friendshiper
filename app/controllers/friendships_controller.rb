class FriendshipsController < ApplicationController

	def create
		# @friendship = current_user.friendships.build(params[:friendship])
		# if @friendship.save
		#   flash[:success] = "You sent friend request!"
		#   redirect_to root_url
		# else
		#   flash[:error] = "Fatal error"
		# end

		@friendship = Friendship.new(params[:product])
	    respond_to do |format|
	      if @friendship.save
	        format.html { redirect_to root_url, notice: "You sent friend request!" }
	        format.json { render json: @friendship, status: :created, location: @friendship }
	      else
	        format.html { 
	          flash.now[:notice]="Error!" 
	        }
	        format.json { render json: @friendship.errors, status: :unprocessable_entity}
	      end
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
