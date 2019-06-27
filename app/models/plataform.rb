class Plataform < ApplicationRecord
  validates :description, presence: true
  validates :description, length: {in: 1..50}
end
