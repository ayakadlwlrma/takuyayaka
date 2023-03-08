class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :genres, dependent: :destroy

        has_many :likes, dependent: :destroy
        has_many :liked_genres, through: :likes, source: :genre

        def already_liked?(genre)
          self.likes.exists?(genre_id: genre.id)
        end

        has_many :others, dependent: :destroy

        has_many :points, dependent: :destroy
        has_many :favorites, dependent: :destroy
        has_many :favorited_points, through: :favorites, source: :point
        def already_favorited?(point)
          self.favorites.exists?(point_id: point.id)
        end

        validates :name, presence: true 
        validates :profile, length: { maximum: 200 } 

        has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

        has_many :followings, through: :following_relationships

        has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy

        has_many :followers, through: :follower_relationships
       
         def following?(other_user)
           following_relationships.find_by(following_id: other_user.id)
         end
       
         def follow!(other_user)
           following_relationships.create!(following_id: other_user.id)
         end
       
         def unfollow!(other_user)
           following_relationships.find_by(following_id: other_user.id).destroy
         end

        
end
