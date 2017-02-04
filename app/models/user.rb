class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy, inverse_of: :user

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save   :downcase_email
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, length: { maximum: 255 }

  def self.authenticate(email:, password:)
    user = User.find_by(email: email)
    user&.valid_password?(password) ? user : nil
  end

  def currency_symbol
    Money::Currency.new(self.currency).symbol
  end

  def activated?
    confirmed?
  end

  # パスワード再設定の期限が切れている場合はtrueを返す
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
