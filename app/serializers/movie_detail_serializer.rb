class MovieDetailSerializer < ActiveModel::Serializer
    attributes :image,:title,:creation_date,:rating,:characters
end    