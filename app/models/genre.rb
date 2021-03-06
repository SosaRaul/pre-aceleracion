class Genre < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true
    has_many :movies , dependent: :destroy
    has_one_attached  :image 
    delegate :url, to: :image, prefix: true 
    
end
