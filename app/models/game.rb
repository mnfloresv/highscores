class Game < ApplicationRecord
  has_many :scores, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end
