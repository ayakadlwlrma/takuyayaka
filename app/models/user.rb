class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        
        mount_uploader :image, ImageUploader


        has_many :messages, dependent: :destroy
        has_many :entries, dependent: :destroy
        
        has_many :points, dependent: :destroy
        has_many :favorites, dependent: :destroy
        has_many :favorited_points, through: :favorites, source: :point
        def already_favorited?(point)
          self.favorites.exists?(point_id: point.id)
        end

        validates :name, presence: true 
        validates :profile, length: { maximum: 200 } 
end
