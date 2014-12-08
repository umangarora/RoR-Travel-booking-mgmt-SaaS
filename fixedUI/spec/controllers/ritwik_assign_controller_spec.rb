require 'rails_helper'

#RSPEC tests for AirlineBooking by Ritwik Shokeen(Team 3)

RSpec.describe AirlinebookingController, :type => :controller do

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "New Airline Booking Form: GET new" do
    it "Creates an empty airline booking form" do
      get :new
      user = assigns(:airlineObj)

      expect(user).to_not eql(nil)

    end
  end


  describe "Create customer: POST createCust" do
    it "Creates a new customer and allocates a new customer ID" do

      user_Params = {:airlineObj => {"custName" => "Ritwik1"}}
      post :createCust, user_Params, valid_session
      user=assigns(:airlineObj)

      expect(user.custId).to_not equal(nil)

    end
  end

  describe "Create customer: POST createCust" do
    it "Creates a new customer and allocates a new customer ID" do

      user_Params = {:airlineObj => {"custName" => "Ritwik2"}}
      post :createCust, user_Params, valid_session
      user=assigns(:airlineObj)

      expect(user.custId).to_not equal(nil)

    end
  end

  describe "Delete customer: POST delCust" do
    it "Deletes an existing customer with a specific customer ID" do

      user_Params = {:airlineObj => {"custId" => "2"}}
      post :delCust, user_Params,
           user=assigns(:airlineObj)

      expect(user).to be==nil

    end

  end

  describe "find customer in airline booking" do
    it "find customer" do

      user_Params = {:airlineObj => {"custId" => "1"}}
      post :findCust, user_Params,
           user=assigns(:airlineObj)

      expect(user).to be==nil

    end

  end

end