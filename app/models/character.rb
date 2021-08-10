class Character < ApplicationRecord
    validates :name,:age,:weight,:history , presence: true
    validates :name,uniqueness: true
    has_many :actors 
    has_many :movies, through: :actors
end
