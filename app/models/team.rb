class Team < ApplicationRecord
    has_many :users, dependent: :nullify
    has_many :team_games, dependent: :destroy
    has_many :games, through: :team_games
    has_many :team_events, dependent: :destroy
    has_many :events, through: :team_events
    belongs_to :manager, class_name: :User, foreign_key: 'manager_id', optional: true

    validates :name, presence: {message: "Please provide a name"}

end
