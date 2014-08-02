require 'spec_helper'

describe UsersController do

  describe 'GET#INDEX' do
    it "should redirect to the root path" do
      authenticate_user
      get :index
      expect(response).to redirect_to root_path
    end
  end

  # describe 'GET#SHOW' do
  #   it "renders the #show view" do
  #     @user = create(:user)
  #     # authenticate_user
  #     get :show, id: @user.id
  #     expect(response).to render_template :show
  #   end
  # end
end