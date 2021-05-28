class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_one_attached :photo

  validates :name, uniqueness: true, presence: true

  def rating_average
    total_rating = movies.sum { |movie| movie.rating }
    (total_rating / movies.size).round(2)
  end
end
