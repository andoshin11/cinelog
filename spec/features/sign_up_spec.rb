require 'rails_helper'

RSpec.describe 'signing up' do
  def sign_up
    password = Faker::Internet.password

    visit '/signup'

    fill_in :user_name, with: Faker::Name.name
    fill_in :user_email, with: Faker::Internet.email
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: password

    find('input[type=submit]').click
  end

  def activate(user:, incorrect_token: nil)
    token = incorrect_token || user.confirmation_token
    visit activate_path(confirmation_token: token)
  end

  describe 'creating new user' do
    subject { -> { sign_up } }

    it { is_expected.to change { User.count }.by 1 }
  end

  describe 'account activation' do
    let(:user) { User.last }

    before { sign_up }

    context 'when activation token is correct' do
      subject { -> { activate(user: user) } }

      it { is_expected.to change { User.last.activated? }.from(false).to(true) }
    end

    context 'when actiovation token is incorrect' do
      subject { -> { activate(user: user, incorrect_token: Faker::Internet.password) } }

      it { is_expected.not_to change { User.last.activated? } }
    end
  end
end
