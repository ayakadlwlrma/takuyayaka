class Point < ApplicationRecord
    belongs_to :user
    has_many :loves, dependent: :destroy
    has_many :loved_users, through: :loves, source: :user
end
