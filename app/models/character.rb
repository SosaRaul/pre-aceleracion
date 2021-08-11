class Character < ApplicationRecord
    validates :name,:age,:weight,:history,:image ,presence: true
    validates :name,uniqueness: true
    has_many :actors 
    has_many :movies, through: :actors
    has_one_attached  :image 
    delegate :url, to: :image, prefix: true 

end
