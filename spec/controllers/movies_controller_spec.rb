require 'spec_helper'

describe MoviesController do

  describe 'GET#INDEX' do
    it "should respond with a 200 request" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'GET#SHOW' do
    it "should respond with a 200 request" do
      get :show
      expect(response.status).to eq(200)
    end
  end

end
