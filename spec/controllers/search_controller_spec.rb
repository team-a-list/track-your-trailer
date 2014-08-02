require 'spec_helper'

describe SearchController do
  describe 'GET#INDEX' do
    it "should respond with a 200 request" do
      authenticate_user

      get :index, q: 'Fight Club'
      expect(response.status).to eq(200)
    end
  end
end