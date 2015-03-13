class UserProfile < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  has_many :availabilities, dependent: :destroy

  validates_presence_of :start_date, :floor, :department, :last_name, :first_name
  validates_uniqueness_of :user_id
end
