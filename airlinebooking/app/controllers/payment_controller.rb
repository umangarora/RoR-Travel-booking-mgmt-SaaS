class PaymentController < ApplicationController

protect_from_forgery except: :create

def create

		@BookingObj = Account_transfers.new(payment_params)
		@BookingObj.save
   

   private 
	def payment_params
		   params.permit(:paymentOptionCheckbox, :accountID, :custBankID)
		end


  end







end
