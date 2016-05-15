class User < ActiveRecord::Base
  include UserDecorator
  has_many :purchase_requests
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.nickname = auth.info.nickname
      user.image = auth.info.image
      user.github_url = auth.info.urls["GitHub"]
      user.blog_url = auth.info.urls["Blog"]
    end
  end

  def password_required?
    super && provider.blank?
  end

  def email_required?
    super && provider.blank?
  end

  def admin?
    Settings.users.admins.include? self.nickname
  end
end
