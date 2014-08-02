require 'spec_helper'

describe RottenTomatoesApi do
  describe 'general content query methods' do
    context "searching" do
      it 'should allow searches with valid search strings' do
        search_string = "Toy Story"
        search_results = RottenTomatoesApi.search(search_string)

        expect(search_results.class).to eq(HTTParty::Response)
        expect(search_results).to have_key("movies")
        expect(search_results["movies"].length).to be <= (6)
      end

      it 'should not error if no movies are found via search' do
        search_string = "1NVAL1D M0VI3"
        search_results = RottenTomatoesApi.search(search_string)

        expect(search_results.class).to eq(HTTParty::Response)
        expect(search_results).to have_key("movies")
        expect(search_results["movies"].length).to eq(0)
      end
    end

  end


  describe 'content seeding methods' do
  end

  describe 'content updating methods' do
  end

end
