class BookingsServersController < ApplicationController
  protect_from_forgery except: :create
	def create

		@BookingObj = Cabbookings.new(cab_params)
		@BookingObj.save
    @BookingObj.booking_ID = @BookingObj.id
    @BookingObj.save
		hash_id={:bookingId => @BookingObj.id}
		render plain: hash_id.to_json

  end

  def update
    @BookingObj = Cabbookings.find_by(booking_ID: params[:bookingId])
    if @BookingObj
      @BookingObj.Source = params[:source]
      @BookingObj.Destination = params[:destination]
      @BookingObj.pickup = params[:pickup]
      if @BookingObj.update(cab_params)
        hash_error = {}
      else
        hash_error = {:error => "Error updating"}
      end
    else
      hash_error = {:error => "Booking not found!"}
    end
    render plain: hash_error.to_json
  end
	
	def find
	
		@BookingObj = Cabbookings.find_by(booking_ID: params[:bookingId])
		if @BookingObj
			hash_id = {:customerId => @BookingObj.Cust_ID, :source => @BookingObj.Source, :destination => @BookingObj.Destination, :pickup => @BookingObj.pickup, :errors => nil}
		else
			hash_id = { :errors => "Account Id not found"}
		end
		render plain: hash_id.to_json
	end

	
	private
		def cab_params
		   params.permit(:Cust_ID, :Source , :Destination, :pickup)
		end


end
