require 'spec_helper'

describe RottenTomatoesApi do
  describe 'general content query methods' do
    context "searching" do
      it 'should allow searches with valid search strings' do
        search_string = "Toy Story"
        search_results = RottenTomatoesApi.search(search_string)

        expect(search_results.class).to eq(HTTParty::Response)
        expect(search_results.length).to be <= (6)
        expect(search_results).to have_key("movies")
      end
    end

  end


  describe 'content seeding methods' do
  end

  describe 'content updating methods' do
  end

end
