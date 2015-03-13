class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :omniauthable

  has_one :user_profile, dependent: :destroy

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(email: data.email).first
    if user
      return user
    else
      User.create(name: data["name"],
                        email: data["email"],
                        password: Devise.friendly_token[0,20]
      )
    end
  end

end
