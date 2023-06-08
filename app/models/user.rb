class User < ApplicationRecord
    has_one :profile
    has_many :game_logs
    has_many :games, through: :game_logs

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 8 }
end
