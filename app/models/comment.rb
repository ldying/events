class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :text, :user, :event,  presence: true

end
