require 'spec_helper'

feature 'View the homepage' do
  before(:each) do
    visit root_path
  end

  scenario 'user sees the header title' do
    expect(page).to have_css 'h1', text: 'TRACK YOUR TRAILER'
  end

  scenario 'user sees the about section' do
    expect(page).to have_css '.subheadline', text: 'Welcome to Track Your Trailer!'
  end

  scenario 'user sees the sign up call to action' do
    expect(page).to have_link 'Sign Up Now >>', href: '/users/sign_up'
  end
end
