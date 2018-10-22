class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # devise :database_authenticatable, :registerable,:confirmable,
  #        :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy, inverse_of: :user
  has_many :movies, dependent: :destroy, inverse_of: :user

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # before_save   :downcase_email
  validates :name, length: { maximum: 50 }
  # validates :email, length: { maximum: 255 }

  # def self.authenticate(email:, password:)
  #   user = User.find_by(email: email)
  #   user&.valid_password?(password) ? user : nil
  # end


#引数に関連するユーザーが存在すればそれを返し、存在しまければ新規に作成する
  def self.find_or_create_from_auth_hash(auth_hash)
#OmniAuthで取得した各データを代入していく
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    image_url = auth_hash[:info][:image]

    if User.find_by(provider: provider, uid: uid).present?
      user = User.find_by(provider: provider, uid: uid)
    else
      user = User.create(provider: provider, uid: uid, name: nickname, nickname: nickname, image_url: image_url)
    end
    user

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

  # def downcase_email
  #   self.email = email.downcase
  # end
end
