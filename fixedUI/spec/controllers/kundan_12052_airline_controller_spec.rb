require 'rails_helper'

RSpec.describe AirlinebookingController, :type => :controller do

  describe "find customer of user (in airline booking)" do
    it "find customer with a specific id" do

      user_Params = {:airlineObj => {"custId" => "4"}}
      post :findCust, user_Params,
           user=assigns(:airlineObj)

      expect(user).to be==nil
      #custName is deleted from customer database corresponding to customer id =4.

    end

  end

  describe "Delete customer of user (in airline booking): POST delCust" do
    it "Deletes an existing customer with a specific customer ID" do

      user_Params = {:airlineObj => {"custId" => "3"}}
      post :delCust, user_Params,
           user=assigns(:airlineObj)

      expect(user).to be==nil
      #custName is deleted from customer database corresponding to customer id =3.

    end

  end

end
