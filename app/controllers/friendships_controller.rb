class FriendshipsController < ApplicationController
    before_action :find_friend

    def create
        @friendship = current_user.friendships.build(friend_id: params[:id])
        @inverse_friendship = @friend.friendships.build(friend_id: current_user.id)
        
        if @friendship.save && @inverse_friendship.save
            flash[:notice] = "Added friend"
            redirect_back(fallback_location: root_path)
        else 
            flash[:error] = "Error occured when adding friend"
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy 
        @friendship = current_user.friendships.find_by(friend_id: params[:id])
        @inverse_friendship = @friend.friendships.find_by(friend_id: current_user.id)
        @inverse_friendship.destroy
        @friendship.destroy 
        flash[:notice] = "Deleted friend"
        redirect_back(fallback_location: root_path)
    end

    def find_friend
        @friend = User.find_by(id: params[:id])
    end
end