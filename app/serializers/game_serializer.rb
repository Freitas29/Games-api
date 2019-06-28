class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :genres, :plataforms, :logo

  def genres
    object.genres.pluck(:description)
  end

  def plataforms
    object.plataforms.pluck(:description)
  end

  def logo
    object.plataforms.map {|p| Rails.application.routes.url_helpers.rails_blob_path(p.logo,only_path: true)}
  end
end
