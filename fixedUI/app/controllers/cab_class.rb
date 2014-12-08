class CabClass
  def initialize(customerId, customerName, myBookingId, mySource, myDestination, myPickup)
    @custName = customerName
    @custId = customerId
    @bookingId = myBookingId
    @source = mySource
    @destination = myDestination
    @pickup = myPickup
    @hash_errors = Hash.new
  end

  attr_accessor :custName, :custId, :balance, :source, :destination, :pickup, :bookingId, :hash_errors
end