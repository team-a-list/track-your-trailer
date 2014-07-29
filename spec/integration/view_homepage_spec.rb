require 'spec_helper'

feature 'View the homepage' do
  scenario 'user sees the header title' do
    visit root_path
    expect(page).to have_css 'h1', text: 'TRACK YOUR TRAILER'
  end

  scenario 'user sees the about section' do
    visit root_path
    expect(page).to have_css '.subheadline', text: 'Welcome to Track Your Trailer!'
  end

  scenario 'user sees the sign up call to action' do
    visit root_path
    expect(page).to have_link 'Sign Up Now >>', href: '/users/sign_up'
  end
end
