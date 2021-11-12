class Game < ApplicationRecord
    has_many :team_games
    has_many :teams, through: :team_games, dependent: :destroy
    has_many :user_games
    has_many :users, through: :user_games
    has_many :events
end
