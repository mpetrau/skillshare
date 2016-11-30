class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # before_destroy :check_for_bookings
  has_many :offers, dependent: :destroy
  has_many :bookings
  has_many :booked_offers, through: :offers, source: :bookings
  validates :name, :photo, presence: true
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  # def check_for_bookings
  #   unless bookings.nil?
  #     flash[:alert] = "If you do this all your offers will be destroyed, are you sure?"
  #   end
  # end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.to_h.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email)
    user_params[:name] = "#{auth.info[:first_name]} #{auth.info[:last_name]}"
    user_params[:remote_photo_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end
end
