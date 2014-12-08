class TravelagentClass
    def initialize(myId, myName, myEmail)
      @agentId = myId
      @agentName = myName
      @email = myEmail
      @hash_errors = Hash.new

    end
    attr_accessor :hash_errors
    attr_accessor :agentId, :agentName, :mobile, :email, :cabset, :railset, :airset, :id
end