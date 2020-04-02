class FriendshipsController < ApplicationController
    def create
        @friendship = current_user.friendships.build(friend_id: params[:friend_id])
        if @friendship.save 
            flash[:notice] = "Added friend"
            redirect_back(fallback_location: root_path)
        else 
            flash[:error] = "Error occured when adding friend"
            redirect_back(fallback_location: root_path)
        end
    end
end
