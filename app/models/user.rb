class User < ApplicationRecord
    has_one :profile
    has_one :game_log
    has_many :games, through: :game_log
end
