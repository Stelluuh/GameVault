class User < ApplicationRecord
    has_one :profile
    has_many :game_logs
    has_many :games, through: :game_logs
end
