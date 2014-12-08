require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

<<<<<<< HEAD
  describe "By Pair 1: GET new" do
    it "Checks if new agent object created" do
      get :new
      user = assigns(:agentObj)
=======
  describe "..." do
    it "..." do
      get :new
      user = assigns(:agentObj)

>>>>>>> origin/17-PaymentOptions-AccountTransfer
      expect(user).to be==nil

    end
  end

end
