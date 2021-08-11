module CharacterSerializers
  class DetailSerializer < ActiveModel::Serializer
    attributes :name,:age,:weight,:history,:image_url
    has_many :movies,serializer: MovieSerializers::DetailSerializer
  end
end