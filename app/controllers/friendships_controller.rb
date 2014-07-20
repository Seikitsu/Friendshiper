class FriendshipsController < ApplicationController

	def create
		@friendship = current_user.friendships.build(friendship_params)
		@friendship.pending!
    respond_to do |format|
      if @friendship.save
        format.html { redirect_to root_url, notice: "You sent friend request!" }
        format.json { render json: @friendship, status: :created, location: @friendship }
        #sends notification
        friend = User.find(@friendship.friend_id)
        @notification = Notification.new(friend: friend.email)
        NotificationMailer.notification_mailer(@notification).deliver
      else
        format.html { 
          flash.now[:notice]="Error!"
        }
        format.json { render json: @friendship.errors, status: :unprocessable_entity}
      end
    end
	end

	def update
    friend = User.find(params[:id])

    @friendship = current_user.friendship_to(friend) || friend.friendship_to(current_user)
    @friendship.approved!
    if @friendship.save
      render json: @friendship, status: :created, location: @friendship
    else
      render json: @friendship.errors, status: :unprocessable_entity
    end
	end

	def destroy
		friend = User.find(params[:id])
    @friendship = current_user.friendship_to(friend) || friend.friendship_to(current_user)
    if @friendship.destroy
      render json: @friendship, status: :created, location: @friendship
    else
      render json: @friendship.errors, status: :unprocessable_entity
    end
	end

	private

	  def friendship_params
	    params.require(:friendship).permit(:friend_id)
	  end
end
