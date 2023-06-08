class Statistic < ApplicationRecord
  belongs_to :user

  validates :total_games_playerd, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :favorite_genre allow_blank: true
  validates :hours_played, numericality: { greater_than_or_equal_to: 0 }

  t.integer "total_games_played"
    t.string "favorite_genre"
    t.integer "hours_played"
end
