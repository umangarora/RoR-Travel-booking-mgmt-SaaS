
require 'rails_helper'

#RSPEC tests for Settings Page by Ritwik Shokeen(Team 3)

RSpec.describe WelcomeController, :type => :controller do

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "New Settings Page: GET new" do
    it "Opens Settings page" do
      get :new
      user = assigns(:agentObj)

      expect(user).to be==nil

    end
  end



end