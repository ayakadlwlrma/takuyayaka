class TagMap < ApplicationRecord
  belongs_to :genre
  belongs_to :tag

  validates :genre_id, presence: true
  validates :tag_id, presence: true
end
