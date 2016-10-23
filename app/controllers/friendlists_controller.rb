class FriendlistsController < ApplicationController
  def index
  	@friends = current_user.friends
  end

  def new
  	@friendlist = Friendlist.new
  	@users_not_me = User.where.not(id: current_user.id)
  	render 'new'
  end

  def create 
  	@friendlist = Friendlist.new(friendlist_params)
  	if @friendlist.save
 	 	redirect_to friendlists_index_path, notice: "Added friend successfully"
     else
     	@users_not_me = User.where.not(id: current_user.id)
     	render 'new'
     end
  end

  private  
  def friendlist_params
  	params.require(:friendlist).permit(:friend_id, :user_id)
  end
end


