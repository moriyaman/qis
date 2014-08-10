require "open-uri"
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  
  has_attached_file :image,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png"
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }  

  scope :uid_is, -> uid { where(uid: uid) }
  scope :is_facebook_user, -> { where(provider: "facebook") }

  def set_image_from_facebook(image_url)
    avatar_url = URI.parse(image_url)
    avatar_url.scheme = 'https'
    avatar_url.to_s
    self.image = open(avatar_url) # assuming the user model has an image
  end

  class << self
    def find_or_create_by_facebook(omniauth_params)
      self.is_facebook_user.uid_is(omniauth_params['uid']).first_or_initialize.tap do |user|
        user.provider = 'facebook'
        user.uid = omniauth_params.uid
        user.email = omniauth_params.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = omniauth_params.info.name   # assuming the user model has a name
        user.access_token = omniauth_params.credentials.token 
        user.set_image_from_facebook(omniauth_params.info.image) # assuming the user model has an image
        binding.pry
        user.save!
      end
    end
  end
end
