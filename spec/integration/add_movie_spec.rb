require 'spec_helper'

feature 'Add a movie to my movies' do
  before(:each) do
    @movie = create(:movie)
  end

  scenario 'successfully adds a movie' do
    sign_in
    add_a_movie(@movie)
    expect(page).to have_css 'h2', text: 'My Movies:'
  end

  scenario 'successfully removes a movie' do
    sign_in
    add_a_movie(@movie)
    click_link('Remove From My List')
    expect(page).to_not have_css '.profile-movie'
  end

  def add_a_movie(movie)
    visit movie_path(movie)
    click_link('Add This Movie')
  end
end