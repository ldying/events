class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  has_many :events
  has_many :comments, dependent: :destroy
  has_many :attendings
  has_many :events_attendings, through: :attendings, source: :event

  validates :first_name, :last_name, :location, :state, :email,  presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

end
