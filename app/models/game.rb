class Game < ApplicationRecord
    has_many :team_games, dependent: :destroy
    has_many :teams, through: :team_games
    has_many :user_games, dependent: :destroy
    has_many :users, through: :user_games
    has_many :events, inverse_of: :game, dependent: :destroy
end
