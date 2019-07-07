class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :genres, :plataforms, :logo, :image

  def genres
    object.genres.map {|g| {
      id: g.id,
      description: g.description
    }}
  end

  def plataforms
    object.plataforms.map {|p| {
      id: p.id,
      description: p.description
    }}
  end

  def image
     "http://localhost:3001/"+Rails.application.routes.url_helpers.rails_blob_path(object.image.blob,only_path: true)
  end

  def logo
    object.plataforms.map {|l| "http://localhost:3001/"+Rails.application.routes.url_helpers.rails_blob_path(l.logo,only_path: true)}
  end
end
