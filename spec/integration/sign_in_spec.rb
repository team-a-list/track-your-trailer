require 'spec_helper'

feature 'Sign in to an account' do
  scenario 'sees the login button' do
    visit root_path
    expect(page).to have_css 'a', text: 'Login'
  end

  scenario 'gets directed to the login page' do
    visit root_path
    click_link('top-nav-login')
    expect(page).to have_selector 'input[type=submit]'
  end

  scenario 'completes a login' do
    create(:confirmed_user)
    visit root_path
    click_link('top-nav-login')
    fill_in('Email', :with => 'greg.eng@gmail.com')
    fill_in('Password', :with => 'password')
    click_button('Sign in')
    expect(page).to have_css '.notice', text: 'Signed in successfully.'
  end
end
