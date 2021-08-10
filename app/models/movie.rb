class Movie < ApplicationRecord
    validates :title, :creation_date, :rating, presence: true
    validates :title, uniqueness: true
    belongs_to :genre
    has_many :actors  
    has_many :characters, through: :actors
end
