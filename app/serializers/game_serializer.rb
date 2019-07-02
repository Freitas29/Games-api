class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :genres, :plataforms, :logo, :image

  def genres
    object.genres.pluck(:description)
  end

  def plataforms
    object.plataforms.pluck(:description)
  end

  def image
     "http://localhost:3001/"+Rails.application.routes.url_helpers.rails_blob_path(object.image.blob,only_path: true)
  end

  def logo
    object.plataforms.map {|p| "http://localhost:3001/"+Rails.application.routes.url_helpers.rails_blob_path(p.logo,only_path: true)}
  end
end
