require 'rails_helper'

#RSPEC tests for Cabbooking Controller/Team3.
#Submitted by: Abhishek Mohabe [2012007]
#We have seeded some values before into the database. Please open database for reference.

RSpec.describe CabbookingController, :type => :controller do

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "New Cab Booking Form: GET new" do
    it "Creates an empty cab booking form" do
      get :new
      user = assigns(:cabObj)

      expect(user).to_not eql(nil)

    end
  end


  describe "Create customer: POST createCust" do
    it "Creates a new customer and allocates a new customer ID" do

      user_Params = {:cabObj => {"custName" => "Abhishek Mohabe"}}
      post :createCust, user_Params, valid_session
      user=assigns(:cabObj)

      expect(user.custId).to_not equal(nil)
      #custId is not nil because a new customer is created whenvever this test is run and a new custId allocated every time which is not nil.

    end
  end

  describe "Find customer: POST findCust" do
    it "Finds a customer based on its customer ID" do

      user_Params = {:cabObj => {"custId" => "8679"}}
      post :findCust, user_Params, valid_session
      user=assigns(:cabObj)

      expect(user.custId).to be=="8679"
      expect(user.custName).to be=="Ashwin"
      #custName is Abhishek corresponding to customer id 1 because it was created in earlier test of create customer..

    end
  end

  describe "Delete customer: POST delCust" do
    it "Deletes an existing customer with a specific customer ID" do

      user_Params = {:cabObj => {"custId" => "4628925326"}}
      post :delCust, user_Params, valid_session
      user=assigns(:cabObj)

      expect(user.custName).to be==nil
      #custName is deleted from customer database corresponding to customer id =2.

    end
  end

  describe "Create Booking: POST book" do
    it "Creates a new booking and allocates a new booking id" do

      user_Params = {:cabObj => {"custId" => "8679", "source" => "Okhla", "destination" => "Gurgaon", "pickup" => "1430"}}
      post :book, user_Params, valid_session
      user=assigns(:cabObj)

      expect(user.custName).to be=="Ashwin"
      expect(user.source).to be=="Okhla"
      expect(user.destination).to be=="Gurgaon"
      expect(user.pickup).to be=="1430"
      expect(user.bookingId).to_not eql(nil)
      #booking is made and the booking id is now not nil.

    end
  end

end