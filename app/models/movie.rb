class Movie < ApplicationRecord
    validates :title, :creation_date, :rating, :image, presence: true
    validates :title, uniqueness: true
    belongs_to :genre
    has_many :actors,  dependent: :destroy
    has_many :characters, through: :actors
    has_one_attached  :image 
    delegate :url, to: :image, prefix: true 

    scope :by_genre, ->(genre) { where(genre: genre)}
end
