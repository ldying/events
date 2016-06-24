class Event < ActiveRecord::Base
  # before_create :validate date is today or later

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :attendings
  has_many :users_attendings, through: :attendings, source: :user
  validates :name, :location, :state, :date, :user, presence: true


end
