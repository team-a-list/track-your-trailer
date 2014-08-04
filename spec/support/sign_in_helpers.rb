module SignInHelpers
  def authenticate_user
    user = double('user')
    request.env['warden'].stub :authenticate! => user
    allow(controller).to receive(:current_user) { user }
  end

  def sign_in
    create(:confirmed_user)
    visit_sign_in_page
    click_link('top-nav-login')
    fill_in('Email', :with => 'greg.eng@gmail.com')
    fill_in('Password', :with => 'password')
    click_button('Sign in')
  end

  def visit_sign_in_page
    visit root_path
    click_link('top-nav-login')
  end

end


Rspec.configure do |config|
  config.include SignInHelpers
end
