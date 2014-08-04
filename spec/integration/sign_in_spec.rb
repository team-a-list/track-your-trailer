require 'spec_helper'

feature 'Sign in to an account' do
  scenario 'sees the login button' do
    visit root_path
    expect(page).to have_css 'a', text: 'Login'
  end

  scenario 'gets directed to the login page' do
    visit_sign_in_page
    expect(page).to have_selector 'input[type=submit]'
  end

  scenario 'completes a login' do
    sign_in
    expect(page).to have_css '.notice', text: 'Signed in successfully.'
  end

  scenario 'logs out' do
    sign_in
    click_link('top-nav-logout')
    expect(page).to have_css 'a', text: 'Login'
  end
end