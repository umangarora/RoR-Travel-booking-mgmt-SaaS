class CustomersController < ApplicationController
protect_from_forgery except: :create
def create

		@customerObj = Customer.new(customer_params)
		@customerObj.save
	
		@customerObj.custId = @customerObj.id
		@customerObj.save

		hash_id={:cId=>@customerObj.custId}
		render plain: hash_id.to_json	

	end
	
	def find
		@custObj = Customer.find_by(custId: params[:custId])
		if @custObj
			@customerDetails = { :custName => @custObj.custName, :errors=>nil }
		else
			@customerDetails = { :custName => nil, :errors=>"Customer not found" }
		end
		
		render plain: @customerDetails.to_json
		
	end

  def delete
    @custObj = Customer.find_by(custId: params[:custId])

    if @custObj
      @custObj.destroy
      @customerDetails = { :errors=>nil }
    else
      @customerDetails = { :errors=>"Customer not found" }
    end
    render plain: @customerDetails.to_json

  end

	private
		def customer_params
		   params.permit(:custName) 
    end

end