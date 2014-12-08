require 'rubygems'
require 'httparty'
require 'json'

class AirlinebookingController < ApplicationController

  def new
    @airlineObj=CabClass.new(nil,nil,nil,nil,nil,nil)
	@airpayment=Payment.new(nil,nil,nil)
	
  end

  def createCust
    @airlineObj=CabClass.new(nil,params[:airlineObj][:custName],nil,nil,nil,nil)
    reply = HTTParty.post(Rails.configuration.fixedUI_url+'customers',
                               :body => { :custName => params[:airlineObj][:custName]}
    )
    cust_id = JSON.parse reply.body
    if (!cust_id.empty?)
      @airlineObj.custId=cust_id["cId"]
    else
      @airlineObj.hash_errors = { :custId => "Customer could not be created!"}
    end
    render 'new'
  end

  def findCust
    @airlineObj=CabClass.new(params[:airlineObj][:custId],nil,nil,nil,nil,nil)
    reply = HTTParty.post(Rails.configuration.fixedUI_url+'customers/find',
                               :body => { :custId => params[:airlineObj][:custId]}
    )
    cust_name = JSON.parse reply.body
    if ( cust_name["errors"]== nil )
      @airlineObj.custName = cust_name["custName"]
    else
      @airlineObj.hash_errors[:error] = cust_name["errors"]
    end
    respond_to do |format|
      format.html { render :new }
      format.json { render json: @airlineObj }
    end
     #render 'new'
  end


def addpaydetails

  reply= HTTParty.post(Rails.configuration.airline_url+'/airlinebooking/payment', :body =>
     { :PaymentOptionCheckbox => params[:airpayment][:paymentOptionCheckbox],
      :AccountID => params[:airpayment][:accountID],:CustBankID => params[:airpayment][:custBankID]
     })
	 
	 redirect_to 'new'
	 
end


<<<<<<< HEAD
reply= HTTParty.post(Rails.configuration.fixedUI_url+'airlines/payment', :body =>
 { :PaymentOptionCheckbox => params[:payment][:PaymentOptionCheckbox],

  :card_number => params[:payment][:CardNumber],:expiry => params[:payment][:Expiry],:cvv => params[:payment][:CVV],:name_on_card => params[:payment][:NameOnCard],

  :AccountID => params[:payment][:AccountID],:CustBankID => params[:payment][:CustBankID]
 })

=======
>>>>>>> origin/17-PaymentOptions-AccountTransfer



  def book
    @airlineObj=CabClass.new(params[:airlineObj][:custId],nil,nil,params[:airlineObj][:source],params[:airlineObj][:destination],params[:airlineObj][:pickup])

    custreply = HTTParty.post(Rails.configuration.fixedUI_url+'customers/find',
                              :body => { :custId => params[:airlineObj][:custId]}
                              )
    custrep = JSON.parse custreply.body

    if ( custrep["errors"]==nil)
      reply = HTTParty.post(Rails.configuration.airline_url+'/bookings_servers',
                            :body => {
                                :Cust_ID => params[:airlineObj][:custId],
                                :Source => params[:airlineObj][:source],
                                :Destination => params[:airlineObj][:destination],
                                :date => params[:airlineObj][:pickup]

                            })

      agentDetails = JSON.parse reply.body

      if (!agentDetails.empty?)
        @airlineObj.bookingId = agentDetails["bookingId"]
      else
        @airlineObj.hash_errors = { :bookingId => "Booking could not be done!"}
      end
      @airlineObj.custName = custrep ["custName"]
    else
      @airlineObj.hash_errors = { :customer => custrep["errors"] }
    end

    render 'new'
  end

  def findBook
    @airlineObj=CabClass.new(nil,nil,params[:airlineObj][:bookingId],nil,nil,nil)
    reply = HTTParty.post(Rails.configuration.airline_url+'/bookings_servers/find',
                          :body => {
                              :bookingId => params[:airlineObj][:bookingId]
                          })

    agentDetails = JSON.parse reply.body
    if (agentDetails["errors"]== nil)
      @airlineObj.custId = agentDetails["customerId"]
      @airlineObj.source = agentDetails["source"]
      @airlineObj.destination = agentDetails["destination"]
      @airlineObj.pickup = agentDetails["date"]
    else
      @airlineObj.hash_errors[:error] = agentDetails["errors"]
    end

    reply = HTTParty.post(Rails.configuration.fixedUI_url+'customers/find',
                          :body => {
                              :custId => @airlineObj.custId
                          })

    custDetails = JSON.parse reply.body
    if (custDetails["errors"] == nil)
      @airlineObj.custName = custDetails["custName"]
    else
      @airlineObj.hash_errors[:error] = custDetails["errors"]
    end

    render 'new'
  end

  def delCust

    @airlineObj=CabClass.new(params[:airlineObj][:custId],nil,nil,nil,nil,nil)
    errors = HTTParty.post(Rails.configuration.fixedUI_url+'customers/delete',
                  :body => {
                      :custId => params[:airlineObj][:custId]
                  })

    errorDetails = JSON.parse errors.body
    if (!errorDetails["errors"] == nil)
      @airlineObj.hash_errors[:error] = custDetails["errors"]
    end
    respond_to do |format|
      format.html { render :new }
      format.json { render json: @airlineObj }
    end
    #render 'new'
  end

  def updateBook
    @airlineObj=CabClass.new(nil,nil,params[:airlineObj][:bookingId],params[:airlineObj][:source],params[:airlineObj][:destination],params[:airlineObj][:pickup])
    reply = HTTParty.post(Rails.configuration.airline_url+'/bookings_servers/update',
                          :body => {
                              :bookingId => params[:airlineObj][:bookingId],
                              :source => params[:airlineObj][:source],
                              :destination => params[:airlineObj][:destination],
                              :date => params[:airlineObj][:pickup]
                          })

    error = JSON.parse reply.body
    if(!error["errors"]==nil)
      @airlineObj.hash_errors[:error] = error["errors"]
    end
    render 'new'
  end


end
