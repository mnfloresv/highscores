class Score < ApplicationRecord
  belongs_to :game
  validates :player_email, :score, presence: true
  validates :score, numericality: { greater_than_or_equal_to: 0 }
  validates :player_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
