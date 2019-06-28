class Game < ApplicationRecord
  validates :title, :description, presence: true
  validates :title, length: { in: 5..50 }
  validates :description, length: { in: 5..250 }

  has_and_belongs_to_many :genres
  has_and_belongs_to_many :plataforms
end
