class Game < ApplicationRecord
  validates :title, :description, presence: true
  validates :title, length: { in: 5...50 }
  validates :description, length: { in: 5...250 }

end
