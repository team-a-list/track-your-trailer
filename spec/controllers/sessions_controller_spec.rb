require 'spec_helper'

describe SessionsController do

  describe "POST#CREATE" do
    context "with valid login information" do
      it "creates a new user session with valid credentials" do
        # post :create, { email: "greg.eng@gmail.com", password: "password" }, valid_session
        # expect(response).to redirect_to root_path

       # @user = create(:user)
       # sign_in @user
       # valid_session = {}

       # create(:user)
       # @request.env["devise.mapping"] = Devise.mappings[:user]
       # get :new
       # post :create, { email: "greg.eng@gmail.com", password: "password" }
       # expect(response).to redirect_to root_path

      # user = FactoryGirl.create(:user)
      # user_params = {
      #   "user" => {
      #     "email" => user.email,
      #     "password" => user.password
      #   }
      # }
      # post user_session_path, { email: "greg.eng@gmail.com", password: "password" }
      expect(response).to redirect_to root_path
      end
    end
  end
end