class Favorite < ApplicationRecord
  belongs_to :point
  belongs_to :user

  validates_uniqueness_of :point_id, scope: :user_id
end
