module MessagesHelper
	def new_messages
  Message.where(:receiver_id => current_user.id, :read_at => nil).count
end
end
