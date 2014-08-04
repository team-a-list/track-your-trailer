module SignInHelpers
  def authenticate_user
    user = double('user')
    request.env['warden'].stub :authenticate! => user
    allow(controller).to receive(:current_user) { user }
  end
end


Rspec.configure do |config|
  config.include SignInHelpers
end
