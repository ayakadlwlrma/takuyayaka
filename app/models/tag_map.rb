class TagMap < ApplicationRecord
  belongs_to :point
  belongs_to :tag

  validates :point_id, presence: true
  validates :tag_id, presence: true
end
