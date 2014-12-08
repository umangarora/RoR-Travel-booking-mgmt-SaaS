class WelcomeController < ApplicationController
  protect_from_forgery except: :settingsUpdate
  def new
    @agentObj = logged_in_user
  end

  def settingsUpdate
    @agentObj = logged_in_user
    arrApps = [false,false,false]
    arrApps[0]=params[:checked_app0]
    arrApps[1]=params[:checked_app1]
    arrApps[2]=params[:checked_app2]

    reply = HTTParty.patch(Rails.configuration.fixedUI_url+'travelagent/'+@agentObj.id.to_s,
                           :body => { :selectedApps => arrApps
                           })

    redirect_to welcome_index_path
  end

  def index
  end
end
