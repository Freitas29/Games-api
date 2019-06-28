class Plataform < ApplicationRecord
  validates :description, presence: true
  validates :description, length: {in: 1..50}

  has_and_belongs_to_many :games
  has_one_attached :logo
  
end
