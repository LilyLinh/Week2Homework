class User < ApplicationRecord
	
	validates :name, presence: true
	validates :email, presence: true, uniqueness: {case_insensitive: false}
	has_secure_password

	has_many :sent_messages, foreign_key: 'sender_id', class_name: 'Message'
	has_many :received_messages, foreign_key: 'receiver_id', class_name: 'Message'
	has_many :my_friendlists, foreign_key: 'user_id', class_name: 'Friendlist'
	has_many :friends, through: :my_friendlists
	has_many :added_friendlists, foreign_key: 'friend_id', class_name: 'Friendlist'
	has_many :added_friends, through: :added_friendlists
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

  
  def unread_messages
    received_messages.unread
  end
