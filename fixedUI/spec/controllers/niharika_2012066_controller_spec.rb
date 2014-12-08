require 'rails_helper'

RSpec.describe CabbookingController, :type => :controller do

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_login_attributes) {
    skip({"user_profile_attributes" => {"email" => "niharika@gmail.com", "password" => "niharika271"}})
  }

  let(:valid_session) { {} }

  #new
  describe "Niharika_2012066: GET new" do
    it "creates an empty object" do
      get :new
      user = assigns(:cabObj)
      expect(user).to_not eql(nil)
    end
  end

  #create customer
  describe "Niharika_2012066: POST create customer" do
    it "creates new customer" do

      @controller = MemberController.new
      user_Params = {:member => {"email" =>"kk94@hotmail.com", "password" => "123" }}
      post :authenticate,user_Params,valid_session

      @controller = CabbookingController.new

      cust_Params= {:cabObj => {"custId" => nil, "custName"=> "Nancy","bookingId"=>nil,"source"=>nil,"destination"=>nil,"pickup"=>nil}}
      post :createCust, cust_Params, valid_session
      user=assigns(:cabObj)

      find_Params= {:cabObj => {"custId" => user.custId, "custName"=> nil,"bookingId"=>nil,"source"=>nil,"destination"=>nil,"pickup"=>nil}}
      post :findCust, find_Params, valid_session
      find_user=assigns(:cabObj)
      expect(user.custName).to eql(find_user.custName)
    end
  end

  #find customer
  describe "Niharika_2012066: POST find customer" do
    it "finds existing customer" do

      @controller = MemberController.new
      user_Params = {:member => {"email" =>"kk94@hotmail.com", "password" => "123" }}
      post :authenticate,user_Params,valid_session

      @controller = CabbookingController.new

      find_Params= {:cabObj => {"custId" => 8679, "custName"=> nil,"bookingId"=>"5678","source"=>nil,"destination"=>nil,"pickup"=>nil}}
      post :findCust, find_Params, valid_session
      find_user=assigns(:cabObj)
      expect(find_user).to_not eql(nil)
      expect(find_user.custId).to eql("8679")
    end
  end

  #delete customer
  describe "Niharika_2012066: POST delete customer" do
    it "deletes existing customer" do

      @controller = MemberController.new
      user_Params = {:member => {"email" =>"kk94@hotmail.com", "password" => "123" }}
      post :authenticate,user_Params,valid_session

      @controller = CabbookingController.new

      del_Params= {:cabObj => {"custId" => 8679, "custName"=> nil,"bookingId"=>"5678","source"=>nil,"destination"=>nil,"pickup"=>nil}}
      post :delCust, del_Params, valid_session
      user=assigns(:cabObj)
      expect(user.custName).to eql(nil)
    end
  end

  #book
  describe "Niharika_2012066: POST book" do
    it "creates new booking" do

      @controller = MemberController.new
      user_Params = {:member => {"email" =>"kk94@hotmail.com", "password" => "123" }}
      post :authenticate,user_Params,valid_session

      @controller = CabbookingController.new

      user_Params = {:cabObj => {"custId" => "5488", "custName"=>nil, "bookingId"=>nil, "source" => "Delhi", "destination" => "Dehradun", "pickup" => "1200"}}
      post :book, user_Params, valid_session
      user=assigns(:cabObj)
      expect(user).to_not eql(nil)
      expect(user.bookingId).to_not eql(nil)
      expect(user.custName).to be=="Niharika"
      expect(user.source).to be=="Delhi"
      expect(user.destination).to be=="Dehradun"
      expect(user.pickup).to be=="1200"
    end
  end
end
