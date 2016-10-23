class Message < ApplicationRecord
	validates :content, presence: true

	belongs_to :sender, foreign_key: 'sender_id', class_name: 'User'
	belongs_to :receiver, foreign_key: 'receiver_id', class_name: 'User'


	scope :unread, -> { where(read_at: nil) }

	def mark_as_read!
		self.read_at = Time.now
		save!
	end
	
	def read?
		read_at
	end

end

