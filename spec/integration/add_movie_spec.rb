require 'spec_helper'

### TODO Refactor repeated code below

feature 'Add a movie to my movies' do
  scenario 'successfully adds a movie' do
    create(:confirmed_user)
    movie = create(:movie)

    visit root_path
    click_link('top-nav-login')
    fill_in('Email', :with => 'greg.eng@gmail.com')
    fill_in('Password', :with => 'password')
    click_button('Sign in')
    expect(page).to have_css '.notice', text: 'Signed in successfully.'

    visit movie_path(movie)
    click_link('Add This Movie')
    expect(page).to have_css 'h2', text: 'My Movies:'
  end

  scenario 'successfully removes a movie' do
    create(:confirmed_user)
    movie = create(:movie)

    visit root_path
    click_link('top-nav-login')
    fill_in('Email', :with => 'greg.eng@gmail.com')
    fill_in('Password', :with => 'password')
    click_button('Sign in')
    expect(page).to have_css '.notice', text: 'Signed in successfully.'

    visit movie_path(movie)
    click_link('Add This Movie')
    expect(page).to have_css 'h2', text: 'My Movies:'

    click_link('Remove From My List')
    expect(page).to_not have_css '.profile-movie'
  end
end