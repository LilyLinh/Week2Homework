class MessagesController < ApplicationController
  def index
  	@messages = Message.where(receiver_id: current_user.id)
  end

  def new
  	@message = Message.new
  	@users_not_me = User.where.not(id: current_user.id)
  	render 'new'
  end

  def create
  	@message = Message.new(message_params)
  	if @message.save
 	 	redirect_to messages_index_path, notice: "Message successfully created"
     else
     	@users_not_me = User.where.not(id: current_user.id)
     	render 'new'
     end
  end

  private  
  def message_params
  	params.require(:message).permit(:content, :sender_id, :receiver_id)
  end
end
  
  def received_messages
  	Message.where(receiver: self)
  end
 
  def sent_messages
  	Message.where(sender: self)
  end

  def latest_received_messages(n)
  	received_messages.order(created_at: :desc).limit(n)
  end





