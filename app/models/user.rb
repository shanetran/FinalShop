class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :likes
  has_many :ratings
  has_many :orders
  has_many :comments
  has_many :wishlists
  has_many :products
  has_many :chats
  has_one :bill
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
  
  def self.verify_key(key)
    where(key: key).update_all(status: "Active")
  end
  def is_admin?
    self.admin == true
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.fullname = auth.info.name 
      user.password = Devise.friendly_token[0,20]
      user.key = SecureRandom.uuid
    end
  end
end
