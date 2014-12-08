require 'rubygems'
require 'httparty'
require 'json'

module MemberLogin
  protected
  @login_incorrect = false

  def incorrect=(value)
    @login_incorrect=value
  end

  def incorrect?
    @login_incorrect
  end

  def is_logged_in?
    if session[:user]
         #change the url accordingly
      myresponse = HTTParty.post(Rails.configuration.fixedUI_url+'travelagent/find',
                                 :body => {
                                     :id => session[:user]
                                 })
      travelagentsDetails = JSON.parse myresponse.body

      @agentObject = TravelagentClass.new(nil,nil,nil)

      if !travelagentsDetails.empty?
        @agentObject.id = travelagentsDetails["id"]
        @agentObject.agentId = travelagentsDetails["agentId"]
        @agentObject.agentName = travelagentsDetails["agentName"]
        @agentObject.email = travelagentsDetails["email"]
        @agentObject.cabset = travelagentsDetails["cabset"]
        @agentObject.railset = travelagentsDetails["railset"]
        @agentObject.airset = travelagentsDetails["airset"]
        @agentObject.mobile = travelagentsDetails["mobile"]
      else
        @agentObject = nil
      end
      @logged_in_user = @agentObject
      return @logged_in_user
    else
      return false
    end
  end

  def logged_in_user          
    return @logged_in_user if is_logged_in?
  end

  def logged_in_user=(user)
    if !user.nil?
      session[:user] = user.id
      @logged_in_user = user
    end
  end

  def self.included(base)
    base.send :helper_method, :is_logged_in?, :logged_in_user, :incorrect?, :incorrect=
  end

end