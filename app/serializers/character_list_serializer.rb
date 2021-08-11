class CharacterListSerializer < ActiveModel::Serializer
    attributes :name
    has_one :image
  end