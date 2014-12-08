require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do

  let(:valid_login_attributes) {
    skip({"user_profile_attributes" => {"email" => "ashwinmathew94@hotmail.com", "password" => "123"}})
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "By 2012028: GET new (Settings Page)" do
    it "gets user = Ashwin as @actual_user and checks all values" do

      @controller = MemberController.new
      user_Params = {:member => {"email" =>"ashwinmathew94@hotmail.com", "password" => "123" }}
      post :authenticate,user_Params,valid_session

      @controller = WelcomeController.new
      get :new

      actual_user = assigns(:agentObj)
      expect(actual_user).to_not eql(nil)
      expect(actual_user.cabset).to_not eql(nil)
      expect(actual_user.railset).to_not eql(nil)
      expect(actual_user.airset).to_not eql(nil)

      expect(actual_user.cabset).to eql(false)
      expect(actual_user.railset).to eql(true)
      expect(actual_user.airset).to eql(false)

      @controller = MemberController.new
      post :logout
    end

    it "creates User = Kundan as @actual_user and checks all values" do

      @controller = MemberController.new
      user_Params = {:member => {"email" =>"kk94@hotmail.com", "password" => "123" }}
      post :authenticate,user_Params,valid_session

      @controller = WelcomeController.new
      get :new

      actual_user = assigns(:agentObj)
      expect(actual_user).to_not eql(nil)
      expect(actual_user.cabset).to_not eql(nil)
      expect(actual_user.railset).to_not eql(nil)
      expect(actual_user.airset).to_not eql(nil)

      expect(actual_user.cabset).to eql(true)
      expect(actual_user.railset).to eql(true)
      expect(actual_user.airset).to eql(true)

      @controller = MemberController.new
      post :logout
    end
  end

  describe "By 2012028: POST settingsUpdate" do
    it "Redirects to Home Page after Settings Page" do

      @controller = MemberController.new
      user_Params = {:member => {"email" =>"kk94@hotmail.com", "password" => "123" }}
      post :authenticate,user_Params,valid_session

      @controller = WelcomeController.new
      setting_params = {:checked_app => [false,true,false]}
      post :settingsUpdate, setting_params, valid_session
      expect(response).to redirect_to('/welcome')

      @controller = MemberController.new
      post :logout

    end
  end

  describe "By 2012028: GET index (Home Page)" do
    it "creates user = Umang as @actual_user and checks all values" do

      @controller = MemberController.new
      user_Params = {:member => {"email" =>"umang94@hotmail.com", "password" => "123" }}
      post :authenticate,user_Params,valid_session

      @controller = WelcomeController.new
      get :index

      actual_user = assigns(:agentObj)
      expect(actual_user).to_not eql(nil)
      expect(actual_user.cabset).to_not eql(nil)
      expect(actual_user.railset).to_not eql(nil)
      expect(actual_user.airset).to_not eql(nil)

      expect(actual_user.cabset).to eql(false)
      expect(actual_user.railset).to eql(false)
      expect(actual_user.airset).to eql(false)

      @controller = MemberController.new
      post :logout
    end

    it "creates user = Vedanshi as @actual_user and checks all values" do

      @controller = MemberController.new
      user_Params = {:member => {"email" =>"ved94@hotmail.com", "password" => "123" }}
      post :authenticate,user_Params,valid_session

      @controller = WelcomeController.new
      get :index

      actual_user = assigns(:agentObj)
      expect(actual_user).to_not eql(nil)
      expect(actual_user.cabset).to_not eql(nil)
      expect(actual_user.railset).to_not eql(nil)
      expect(actual_user.airset).to_not eql(nil)

      expect(actual_user.cabset).to eql(true)
      expect(actual_user.railset).to eql(true)
      expect(actual_user.airset).to eql(false)

      @controller = MemberController.new
      post :logout

    end

  end

end
=begin
  describe "By 2012028: GET new (Sign up Page)" do
    it "creates empty User as @user" do
      get :new
      actual_user = assigns(:agentObj)
      expect(actual_user).to_not eql(nil)
    end
  end

  describe "By 2012028: POST authenticate (After Log in)" do
    it "assigns newly created user to @user" do
      user_Params = {:member => {"email" =>"abc", "password" => "123" }}
      post :authenticate,user_Params,valid_session
      user=assigns(:agentObj)
      expect(user).to_not eql(nil)
      expect(user.email).to_not eql(nil)
      expect(user.agentName).to_not eql(nil)
      expect(user.agentId).to_not eql(nil)
      expect(user.mobile).to_not eql(nil)

      expect(user.email).to eql("abc")
      expect(user.agentName).to eql("abcd")
      expect(user.agentId).to eql(123)
      expect(user.mobile).to eql(123)
    end
  end

  describe "By 2012028: POST SignupCreate (After Sign up)" do
    it "assigns newly created user to @user" do
      user_Params = {:travelagent => {"email" =>"abc", "password" => "123" }}
      post :authenticate,user_Params,valid_session
      user=assigns(:agentObj)
      expect(user).to_not eql(nil)
      expect(user.email).to_not eql(nil)
      expect(user.agentName).to_not eql(nil)
      expect(user.agentId).to_not eql(nil)
      expect(user.mobile).to_not eql(nil)

      expect(user.email).to eql("abc")
      expect(user.agentName).to eql("abcd")
      expect(user.agentId).to eql(123)
      expect(user.mobile).to eql(123)
    end
  end
=end

