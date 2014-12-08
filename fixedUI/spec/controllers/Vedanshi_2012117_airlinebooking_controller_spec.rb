require 'rails_helper'



RSpec.describe AirlinebookingController, :type => :controller do

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_login_attributes) {
    skip({"user_profile_attributes" => {"email" => "niharika@gmail.com", "password" => "niharika271"}})
  }

  let(:valid_session) { {} }

  #new
  describe "Vedanshi: GET new" do
    it "creates an empty object" do
      get :new
      user = assigns(:airlineObj)
      expect(user).to_not eql(nil)
    end
  end

  #create customer
  describe "Vedanshi: POST create customer" do
    it "creates new customer" do

      @controller = MemberController.new
      user_Params = {:member => {"email" =>"kk94@hotmail.com", "password" => "123" }}
      post :authenticate,user_Params,valid_session

      @controller = AirlinebookingController.new

      cust_Params= {:airlineObj => {"custId" => nil, "custName"=> "Nancy","bookingId"=>nil,"source"=>nil,"destination"=>nil,"pickup"=>nil}}
      post :createCust, cust_Params, valid_session
      user=assigns(:airlineObj)

      find_Params= {:airlineObj => {"custId" => user.custId, "custName"=> nil,"bookingId"=>nil,"source"=>nil,"destination"=>nil,"pickup"=>nil}}
      post :findCust, find_Params, valid_session
      find_user=assigns(:airlineObj)
      expect(user.custName).to eql(find_user.custName)
    end
  end

  #delete customer
  describe "POST delete customer" do
    it "deletes existing customer" do

      @controller = MemberController.new
      user_Params = {:member => {"email" =>"kk94@hotmail.com", "password" => "123" }}
      post :authenticate,user_Params,valid_session

      @controller = CabbookingController.new

      del_Params= {:cabObj => {"custId" => 7894, "custName"=> nil,"bookingId"=>"4875","source"=>nil,"destination"=>nil,"date"=>nil}}
      post :delCust, del_Params, valid_session
      user=assigns(:cabObj)
      expect(user.custName).to eql(nil)
    end
  end
end
