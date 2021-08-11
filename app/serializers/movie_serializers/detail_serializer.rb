module MovieSerializers  
  class DetailSerializer < ActiveModel::Serializer
    attributes :image_url,:title,:creation_date,:rating
    has_one :genre, serializer: GenreSerializers::DetailSerializer
    has_many :characters, serializer: CharacterSerializers::DetailSerializer
  end
end  
