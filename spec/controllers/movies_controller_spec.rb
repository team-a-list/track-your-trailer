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
      movie = FactoryGirl.create(:movie)
      get :show, id: movie
      expect(response.status).to eq(200)
      expect(response).to render_template :show
    end
  end

  describe 'GET#ALL_MOVIES' do
    it "should respond with a 200 request" do
      get :all_movies
      expect(response.status).to eq(200)
      expect(response).to render_template :all_movies
    end
  end

end
