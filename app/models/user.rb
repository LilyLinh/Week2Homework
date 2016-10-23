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

