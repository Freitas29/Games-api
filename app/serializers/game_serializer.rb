class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :genres, :plataforms


end
