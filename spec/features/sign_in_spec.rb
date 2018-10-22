require 'rails_helper'

RSpec.describe 'signing in' do
  let(:user) { create(:user) }

  def sign_in(user)
    visit '/login'

    fill_in :session_email, with: user.email
    fill_in :session_password, with: user.password
    find('input[type=submit]').click
  end

  subject { -> { sign_in(user) } }

  it { is_expected.to change { current_path }.to(dashboard_path) }
end
