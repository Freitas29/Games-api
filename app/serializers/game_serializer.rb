class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :genres, :plataforms

  def genres
    object.genres.pluck(:description)
  end

  def plataforms
    object.plataforms.pluck(:description)
  end
  
end
