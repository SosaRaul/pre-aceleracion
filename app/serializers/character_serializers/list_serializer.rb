module CharacterSerializers
  class ListSerializer < ActiveModel::Serializer
      attributes :name,:image_url
  end
end