require 'rails_helper'

RSpec.describe User, type: :model do
  subject { user }

  let(:user) { build(:user) }

  context 'when built from factory' do
    it { is_expected.to be_valid }
  end

  describe '#email' do
    context 'when blank' do
      let(:user) { build(:user, email: '') }

      it { is_expected.to be_invalid }
    end

    context 'when too long' do
      let(:user) { build(:user, email: "#{'a' * 244}@example.com") }

      it { is_expected.to be_invalid }
    end

    context 'when valid' do
      let(:valid_email_addresses) { %w(user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn) }
      let(:users) { valid_email_addresses.map { |e| build(:user, email: e) } }

      it 'is invalid' do
        expect(users).to all be_valid
      end
    end

    context 'when invalid' do
      let(:invalid_email_addresses) { %w(user@example,com user_at_foo.org user.name@example.  foo@bar_baz.com foo@bar+baz.com) }
      let(:users) { invalid_email_addresses.map { |e| build(:user, email: e) } }

      it 'is invalid' do
        expect(users).to all be_invalid
      end
    end

    context 'when not unique' do
      let(:user) { build(:user, email: duplicate_user.email) }
      let(:duplicate_user) { create(:user) }

      it { is_expected.to be_invalid }
    end
  end

  describe '#name' do
    context 'when blank' do
      let(:user) { build(:user, name: '') }

      it { is_expected.to be_invalid }
    end

    context 'when too long' do
      let(:user) { build(:user, name: 'a' * 51) }

      it { is_expected.to be_invalid }
    end
  end

  describe '#password' do
    context 'when blank' do
      let(:user) { build(:user, password: '      ') }

      it { is_expected.to be_invalid }
    end

    context 'when too short' do
      let(:user) { build(:user, password: 'aaaaa') }

      it { is_expected.to be_invalid }
    end
  end
end
