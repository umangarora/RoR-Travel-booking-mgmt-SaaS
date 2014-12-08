require 'rails_helper'

RSpec.describe CabbookingController, :type => :controller do

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_login_attributes) {
    skip({"user_profile_attributes" => {"email" => "vedanshi@gmail.com", "password" => "vedanshi123"}})
  }

  let(:valid_session) { {} }


#find booking
  describe "Vedanshi: POST find booking" do
    it "finds booking by id" do

      @controller = MemberController.new
      user_Params = {:member => {"email" =>"kk94@hotmail.com", "password" => "123" }}
      post :authenticate,user_Params,valid_session

      @controller = CabbookingController.new

      find_Params= {:cabObj => {"custId" => 8679, "custName"=> nil,"bookingId"=>"5678","source"=>nil,"destination"=>nil,"pickup"=>nil}}
      post :findBook, find_Params, valid_session
      find_user=assigns(:cabObj)
      expect(find_user).to_not eql(nil)
      expect(find_user.custId).to eql(8679)
      expect(find_user.bookingId).to eql("5678")
      expect(find_user.source).to eql("Ajmer")
      expect(find_user.destination).to eql("Madurai")
      expect(find_user.pickup).to eql(1)
    end
  end



#update booking
  describe "Vedanshi: POST update booking" do
    it "updates existing booking" do

      @controller = MemberController.new
      user_Params = {:member => {"email" =>"kk94@hotmail.com", "password" => "123" }}
      post :authenticate,user_Params,valid_session

      @controller = CabbookingController.new

      cust_Params = {:cabObj => {"custId" => 7894, "custName"=> nil,"bookingId"=>"4578","source"=>"Meerut","destination"=>"Delhi","pickup"=>"1300"}}
      post :updateBook, cust_Params, valid_session
      user=assigns(:cabObj)

      find_Params= {:cabObj => {"custId" => 7894, "custName"=> nil,"bookingId"=>"4578","source"=>nil,"destination"=>nil,"pickup"=>nil}}
      post :findBook, find_Params, valid_session
      find_user=assigns(:cabObj)
      expect(user.source).to eql(find_user.source)
    end
  end


end