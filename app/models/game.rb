class Game < ApplicationRecord
  validates :title, :description, presence: true
  validates :title, length: { in: 5..50 }
  validates :description, length: { in: 5..250 }

  has_one_attached :image
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :plataforms

  scope :by_genres, -> (genres) { joins(:genres).where("genres.description": genres)}
  scope :by_plataforms, -> (plataforms) { joins(:plataforms).where("plataforms.description": plataforms)}
  scope :by_title, -> (title) {where("title like ?", "#{title}%")}
  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']


  def self.filter(params)
    games = self.all
    games = self.by_genres(params[:by_genres]) if params[:by_genres].present?
    games = self.by_plataforms(params[:by_plataforms]) if params[:by_plataforms].present?
    games
  end
end
