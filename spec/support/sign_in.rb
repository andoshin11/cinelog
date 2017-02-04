include Warden::Test::Helpers

module SignIn
  def sign_in(user)
    login_as user
  end
end

RSpec.configure do |config|
  config.include SignIn, type: :feature
  config.include SignIn, type: :request
end
