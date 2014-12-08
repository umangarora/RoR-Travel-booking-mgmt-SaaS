require 'rubygems'
require 'httparty'
require 'json'

class CabbookingController < ApplicationController

  def new
    @cabObj=CabClass.new(nil,nil,nil,nil,nil,nil)
  end

  def createCust
    @cabObj=CabClass.new(nil,params[:cabObj][:custName],nil,nil,nil,nil)
    reply = HTTParty.post(Rails.configuration.fixedUI_url+'customers',
                          :body => { :custName => params[:cabObj][:custName]}
    )
    cust_id = JSON.parse reply.body
    if (!cust_id.empty?)
      @cabObj.custId=cust_id["cId"]
    else
      @cabObj.hash_errors = { :custId => "Customer could not be created!"}
    end

    #respond_to do |format|
      #format.html { render :new }
      #format.json { render json: @cabObj }
    #end

    #respond_to do |format|
    # format.html { render :new }
    #format.json { render json: @cabObj }
    #end
    render 'new'
  end

  def findCust
    @cabObj=CabClass.new(params[:cabObj][:custId],nil,nil,nil,nil,nil)
    reply = HTTParty.post(Rails.configuration.fixedUI_url+'customers/find',
                          :body => { :custId => params[:cabObj][:custId]}
    )
    cust_name = JSON.parse reply.body
    if ( cust_name["errors"]== nil )
      @cabObj.custName = cust_name["custName"]
    else
      @cabObj.hash_errors[:error] = cust_name["errors"]
    end
    respond_to do |format|
      format.html { render :new }
      format.json { render json: @cabObj }
    end
  end

  def book
    @cabObj=CabClass.new(params[:cabObj][:custId],nil,nil,params[:cabObj][:source],params[:cabObj][:destination],params[:cabObj][:pickup])

    custreply = HTTParty.post(Rails.configuration.fixedUI_url+'customers/find',
                              :body => { :custId => params[:cabObj][:custId]}
    )
    custrep = JSON.parse custreply.body

    if ( custrep["errors"]==nil)
      reply = HTTParty.post(Rails.configuration.cab_url+'bookings_servers',
                            :body => {
                                :Cust_ID => params[:cabObj][:custId],
                                :Source => params[:cabObj][:source],
                                :Destination => params[:cabObj][:destination],
                                :pickup => params[:cabObj][:pickup]

                            })

      agentDetails = JSON.parse reply.body

      if (!agentDetails.empty?)
        @cabObj.bookingId = agentDetails["bookingId"]
      else
        @cabObj.hash_errors = { :bookingId => "Booking could not be done!"}
      end
      @cabObj.custName = custrep ["custName"]
    else
      @cabObj.hash_errors = { :customer => custrep["errors"] }
    end
    #respond_to do |format|
     # format.html { render :new }
      #format.json { render json: @cabObj }
    #end
    render 'new'
  end

  def findBook
    @cabObj=CabClass.new(nil,nil,params[:cabObj][:bookingId],nil,nil,nil)
    reply = HTTParty.post(Rails.configuration.cab_url+'bookings_servers/find',
                          :body => {
                              :bookingId => params[:cabObj][:bookingId]
                          })

    agentDetails = JSON.parse reply.body
    if (agentDetails["errors"]== nil)
      @cabObj.custId = agentDetails["customerId"]
      @cabObj.source = agentDetails["source"]
      @cabObj.destination = agentDetails["destination"]
      @cabObj.pickup = agentDetails["pickup"]
    else
      @cabObj.hash_errors[:error] = agentDetails["errors"]
    end

    reply = HTTParty.post(Rails.configuration.fixedUI_url+'customers/find',
                          :body => {
                              :custId => @cabObj.custId
                          })

    custDetails = JSON.parse reply.body
    if (custDetails["errors"] == nil)
      @cabObj.custName = custDetails["custName"]
    else
      @cabObj.hash_errors[:error] = custDetails["errors"]
    end
   # respond_to do |format|
    #  format.html { render :new }
     # format.json { render json: @cabObj }
    render 'new'
   # end
  end

  def delCust

    @cabObj=CabClass.new(params[:cabObj][:custId],nil,nil,nil,nil,nil)
    errors = HTTParty.post(Rails.configuration.fixedUI_url+'customers/delete',
                           :body => {
                               :custId => params[:cabObj][:custId]
                           })

    errorDetails = JSON.parse errors.body
    if (!errorDetails["errors"] == nil)
      @cabObj.hash_errors[:error] = custDetails["errors"]
    end
    #respond_to do |format|
    # format.html { render :new }
    #format.json { render json: @cabObj }
    #end
    render 'new'
  end

  def updateBook
    @cabObj=CabClass.new(nil,nil,params[:cabObj][:bookingId],params[:cabObj][:source],params[:cabObj][:destination],params[:cabObj][:pickup])
    reply = HTTParty.post(Rails.configuration.cab_url+'bookings_servers/update',
                          :body => {
                              :bookingId => params[:cabObj][:bookingId],
                              :source => params[:cabObj][:source],
                              :destination => params[:cabObj][:destination],
                              :pickup => params[:cabObj][:pickup]
                          })

    error = JSON.parse reply.body
    if(!error["errors"]==nil)
      @cabObj.hash_errors[:error] = error["errors"]
    end
 #   respond_to do |format|
  #    format.html { render :new }
   #   format.json { render json: @cabObj }
    #end
    render 'new'
  end

end
