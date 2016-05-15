class User < ActiveRecord::Base
  include UserDecorator
  has_many :purchase_requests
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth(auth)
    # providerとuidでUserレコードを取得する
    # 存在しない場合は、ブロック内のコードを実行して作成する
    #binding.pry
    #TODO: GitHubでEmailを設定したが取得できない
    #auth.info
    #{"nickname"=>"xxxxxxxx", "email"=>nil, 
    #{"name"=>"xxxxx xxxxx", 
    #"image"=>"https://avatars.githubusercontent.com/u/10795621?v=3", 
    #{}"urls"=>{"GitHub"=>"https://github.com/xxxxxxxx", "Blog"=>nil}}
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.nickname = auth.info.nickname
      #user.email = auth.info.email
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
end
