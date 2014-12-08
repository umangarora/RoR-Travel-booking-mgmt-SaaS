require 'digest/sha2'

class Travelagent < ActiveRecord::Base
	validates :email, presence: true
	validates :password, presence: true
	
	validates_uniqueness_of :email, :case_sensitive => false
	
	def self.encrypt(string)
		return Digest::SHA256.hexdigest(string)
	end
	
	def self.hash_authenticate(inpEmail, inpPassword)
		@agentRecord = Travelagent.find_by(email: inpEmail)
		if @agentRecord
			if @agentRecord.hashed_password == Travelagent.encrypt(inpPassword)
				return @agentRecord
			else
				return nil
			end
		else
			return nil
		end
	end
end
