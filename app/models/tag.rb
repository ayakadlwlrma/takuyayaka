class Tag < ApplicationRecord
    validates :tag_name, presence: true
    has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
    has_many :points, through: :tag_maps, dependent: :destroy
end
