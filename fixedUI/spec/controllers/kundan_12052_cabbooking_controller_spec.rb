#require 'rails_helper'
require_relative '../rails_helper.rb'

RSpec.describe CabbookingController, :type => :controller do

  #describe "delete" do

    describe "Delete customer of a user (in cab booking): POST delCust" do
      it "Deletes an existing customer with a specific customer ID" do

        user_Params = {:cabObj => {"custId" => "3"}}
        post :delCust, user_Params,
        user=assigns(:cabObj)

        expect(user).to be==nil
        #custName is deleted from customer database corresponding to customer id =3.

      end

    end

    describe "find customer of a user (in cab booking)" do
      it "find customer" do

        user_Params = {:cabObj => {"custId" => "4"}}
        post :findCust, user_Params,
             user=assigns(:cabObj)

        expect(user).to be==nil
        #custName is deleted from customer database corresponding to customer id =4.

      end

    end
  end
