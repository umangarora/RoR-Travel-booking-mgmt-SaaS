class MemberController < ApplicationController
  def index
    if is_logged_in?
      redirect_to welcome_index_path
    end
  end

  def authenticate
    @agentObj = TravelagentClass.new(nil,nil,nil)

    reply = HTTParty.post(Rails.configuration.fixedUI_url+'travelagent/authenticate',
                               :body => {
                                   :email => params[:member][:email],
                                   :password => params[:member][:password]
                               })

    agentDetails = JSON.parse reply.body

    if !agentDetails.empty?

      @agentObj.id = agentDetails["id"]
      @agentObj.agentId = agentDetails["agentId"]
      @agentObj.agentName = agentDetails["agentName"]
      @agentObj.email = agentDetails["email"]
      @agentObj.cabset = agentDetails["cabset"]
      @agentObj.railset = agentDetails["railset"]
      @agentObj.airset = agentDetails["airset"]
      @agentObj.mobile = agentDetails["mobile"]
    else
      @agentObj = nil
    end

    self.logged_in_user = @agentObj
    if is_logged_in?
      redirect_to welcome_index_path
    else
      self.incorrect = true
      render 'index'
    end
  end

  def new
    @agentObj = TravelagentClass.new(nil, nil, nil)
  end

  def signupCreate
    @agentObj = TravelagentClass.new(params[:travelagent][:agentId], params[:travelagent][:agentName], params[:travelagent][:email])
    if ((params[:travelagent][:password] != '') && (params[:travelagent][:password_confirmation] != '') )

      myresponse = HTTParty.post(Rails.configuration.fixedUI_url+'travelagent',
                                 :body => { :agentId => params[:travelagent][:agentId],
                                            :agentName => params[:travelagent][:agentName],
                                            :mobile => params[:travelagent][:mobile],
                                            :password => params[:travelagent][:password],
                                            :password_confirmation => params[:travelagent][:password_confirmation],
                                            :email => params[:travelagent][:email]
                                 })

      @agentObj.hash_errors = JSON.parse myresponse.body

    else
      @agentObj.hash_errors = { :password => "Password fields can't be nil and must be equal!"}
    end
    if @agentObj.hash_errors.empty?      #if empty? is true it means no errors are there
      redirect_to member_index_path
    else
      render 'new'
    end
  end

  def logout
    if request.post?
      reset_session
      self.incorrect = false
    end
    redirect_to member_index_path
  end


  private
  def travelagent_params
    params.require(:agentObj).permit(:agentId, :agentName, :mobile, :emailId, :cabset, :railset, :airset)
  end
end
