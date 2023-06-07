class Game < ApplicationRecord
    has_many :users, through: :game_log
end
