class MessagesController < ApplicationController

  def index
  	@messages = Message.where(sender_id: current_user.id)
    @message = Message.where(receiver_id: current_user.id)
    if params[:sort_column].present?
      @messages = @messages.order("#{params[:sort_column]} #{params[:sort_direction]}")
    end
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

  

  def show
    @message = Message.where(receiver: current_user).find params[:id]
    @is_read = @message.read? 
    unless @message.read? 
      @message.mark_as_read!
    end
  end

  def sent
    load_user
    @messages = @user.sent_messages
  end
  
  def received
    load_user
    @messages = @user.received_messagess
  end
  
  def load_user
    if params[:user_id]
      @user = User.find params[:user_id]
    else
      @user = current_user
    end
  end


  private  
  def message_params
    params.require(:message).permit(:content, :sender_id, :receiver_id)
  end
end




