class Availablity < ActiveRecord::Base

  belongs_to :user_profile, foreign_key: :user_profile_id
end
