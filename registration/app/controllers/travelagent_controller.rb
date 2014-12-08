require 'rubygems'
require 'httparty'
require 'json'

class TravelagentController < ApplicationController
  protect_from_forgery except: :authenticate
	def authenticate
		@agentObj = Travelagent.hash_authenticate(params[:email], params[:password])
		if @agentObj
			@agentdetails = { :agentId => @agentObj.agentId, :agentName => @agentObj.agentName, :email => @agentObj.email, :mobile => @agentObj.mobile,
						:cabset => @agentObj.cabset, :railset => @agentObj.railset, :airset => @agentObj.airset,
						:id => @agentObj.id }
		
			render plain: @agentdetails.to_json
		else
			@agentdetails = {}
			render plain: @agentdetails.to_json
		end
	end
	
	def find
		@agentObj = Travelagent.find(params[:id])
		if @agentObj
			@agentdetails = { :agentId => @agentObj.agentId, :agentName => @agentObj.agentName, :email => @agentObj.email, :mobile => @agentObj.mobile,
						:cabset => @agentObj.cabset, :railset => @agentObj.railset, :airset => @agentObj.airset,
						:id => @agentObj.id }
		
			render plain: @agentdetails.to_json
		else
			@agentdetails = {}
			render plain: @agentdetails.to_json
		end
	end
	
	def create
		permit_params
		if (params[:password] == params[:password_confirmation])
			@travelagentObj = Travelagent.new(travelagent_params)
			@travelagentObj.hashed_password = Travelagent.encrypt(params[:password])
			@travelagentObj.cabset = 0
			@travelagentObj.railset = 0
			@travelagentObj.airset = 0
			@travelagentObj.save
    else
      @travelagentObj = Travelagent.new(travelagent_params)
			@travelagentObj.errors[:base] << "Password error"
		end
		render plain: @travelagentObj.errors.messages.to_json
	end
	
	def update
		@user = Travelagent.find_by(id: params[:id])
		arrCheckedBoxes = params[:selectedApps]
		
		@user.cabset = arrCheckedBoxes[0]
		@user.railset = arrCheckedBoxes[1]
		@user.airset = arrCheckedBoxes[2]
		@user.save
			
		respond_to do |format|
			if @user.save
				@updateStatus = { :upStat => true}
				format.json { render json: @updateStatus, status: :ok}
			else
				@updateStatus = { :upStat => false, :errors => @user.errors}
				format.json { render json: @updateStatus, status: :unprocessable_entity }
			end
		end
	end
	
	private
		def permit_params
			params.permit(:agentId, :agentName, :mobile, :hashed_password, :email, :cabset, :railset, :airset, :password, :password_confirmation)
		end
		def travelagent_params
      params.permit(:agentId, :agentName, :mobile, :password, :email)
		end
end
