class Event < ActiveRecord::Base
  # before_create :validate date is today or later

  validate :future_date_check
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :attendings
  has_many :users_attendings, through: :attendings, source: :user
  validates :name, :location, :state, :date, :user, presence: true


  private
  def future_date_check
    return if date.blank?
 
    if date < Date.today
    errors.add(:date, "must be today or a future date") 
    end 
  end

end
