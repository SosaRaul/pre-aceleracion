class MovieListSerializer < ActiveModel::Serializer
  attributes :title,:creation_date
  has_one :image
end
