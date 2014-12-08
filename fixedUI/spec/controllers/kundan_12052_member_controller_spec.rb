

#RSpec.describe Kundan12052MemberController, :type => :controller do
require_relative '../rails_helper.rb'



RSpec.describe MemberController, :type => :controller do


  let(:valid_login_attributes) {
    skip({"user_profile_attributes" => {"login" => "man", "password" => "man"}})
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "By roll number 1: GET login" do
    it "creates empty User as @user" do
      get :new
      #get :login, {} # send a get request at the desired location
      actual_user = assigns(:agentObj) # it would @user variable from controller
      expect(actual_user).to_not eql(nil) # check the actual output with the expected output
      #expect(actual_user.user_profile).to_not eql(nil) # check the actual output with the expected output
      # expect is an expectation
    end
  end


  describe "it checks for login authentication" do
    it "takes email and pasword as parameter and check and redirect to welcome/home/dashboard page" do
      user_Params = {:member => {"email" => "ved94@hotmail.com", "password" => "123"}}
      post :authenticate, user_Params, valid_session
      user=assigns(:agentObj)
      expect(user).to_not eql(nil)
      expect(response).to redirect_to welcome_index_path
    end
  end


  describe "it checks for login authenticatio" do
    it "takes email and pasword as parameter and simply redirects" do
      user_Params = {:member => {"email" => "ved94@hotmail.com", "password" => "123"}}
      post :authenticate, user_Params, valid_session
      user=assigns(:agentObj)
      expect(response).to redirect_to welcome_index_path
    end
  end



  describe "GET new: renders a new page" do
    before {get :new}
   it "renders new temp " do
      expect(response).to render_template("new")
    end
  end


  describe "POST SignupCreate that is after clicking sign up " do
    it "assigns newly created user to @user" do
      user_Params = {:travelagent => {"agentId" => "4658", "agentName" => "Vedanshi", "mobile" => "9968837356", "email" =>"ved94@hotmail.com", "password" => "123", "password_confirmation" => "123" }}
      #post :signupCreate, {:travelagent => {"agentId" => "4658", "agentName" => "Vedanshi", "mobile" => "9968837356", "email" =>"ved94@hotmail.com", "password" => "123", "password_confirmation" => "123" }}
      post :signupCreate,user_Params,valid_session
      user=assigns(:agentObj)
      #validAgentObj = {:travelagent => {"email" => "ved94@hotmail.com", "password" => "123"}}
      #post :authenticate, user_Params, valid_session
      #user = assigns(:agentObj)
      #expect(actual_user).to_not eql(nil)
      #expect(user).to_not eql(nil)
      #expect(user.email).to_not eql(nil)

      #expect(user.agentName).to_not eql(nil)
      #expect(user.agentId).to_not eql(nil)
      #expect(user.mobile).to_not eql(nil)

     expect(user.email).to eql("ved94@hotmail.com")
      #expect(user.agentName).to eql("kundan")
      #expect(user.agentId).to eql(4658)
      #expect(user.mobile).to eql(9968837356)
      expect(user.hash_errors.size).to eql(1)
    end
  end





=begin
    let(:valid_login_attributes) {
      skip({"user_profile_attributes" => {"login" => "man", "password" => "man"}})
    }

    let(:invalid_attributes) {
      skip("Add a hash of attributes invalid for your model")
    }

    let(:valid_session) { {} }

    describe "By roll number 1: GET ask_login" do
      it "creates empty User as @member" do
        get :welcome_index_path, {} # send a get request at the desired location
        actual_user = assigns(:agentObj) # it would @user variable from controller
        expect(actual_user).to_not eql(nil) # check the actual output with the expected output
        expect(actual_user.user_profile).to_not eql(nil) # check the actual output with the expected output
        # expect is an expectation
      end
    end
=end


end
