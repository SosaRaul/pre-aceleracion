module MovieSerializers
  class ListSerializer < ActiveModel::Serializer
    attributes :title,:creation_date,:image_url
    
  end
end  
