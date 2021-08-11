class CharacterDetailSerializer < ActiveModel::Serializer
  attributes :name,:age,:weight,:history,:image,:movies
end
