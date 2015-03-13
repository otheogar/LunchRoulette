class Availablity < ActiveRecord::Base

  WEEKDAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']

  belongs_to :user_profile, foreign_key: :user_profile_id

  validates_uniqueness_of :day, scope: :user_profile
end
