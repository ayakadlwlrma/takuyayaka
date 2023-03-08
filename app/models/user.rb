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
end
