require_relative '../rails_helper.rb'

#RSpec.describe story17Controller, :type => :controller do

  RSpec.describe airlinebookingController, :type => :controller do

    let(:invalid_attributes) {
      skip("Add a hash of attributes invalid for your model")
    }

    let(:valid_session) { {} }

   

    describe "..." do
      it "...." do
        user_Params = {:payment => {"AccountID" => "7645", "CustBankID" => "4355"}}
        post :authenticate, user_Params, valid_session
        user=assigns(:payment)
        expect(AccountID).to_not eql(nil)
        #khgkj
      end
    end

end