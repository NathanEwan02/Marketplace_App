class Team < ApplicationRecord
    has_many :users, dependent: :nullify
    has_many :team_games, dependent: :destroy
    has_many :games, through: :team_games
    has_many :team_events, dependent: :destroy
    has_many :events, through: :team_events

    validates :name, presence: {message: "Please provide a name"}
    validate :user_not_taken
    #validate :check

    def check
        u = users.empty?
        if u == false
            errors.add(:user_id, " is already in a team")
        end
    end

    def user_not_taken
        user_has_team = users.map { |u| u.team_id }.nil? 
        if user_has_team == true
            errors.add(:user_id, " is already in a team")
        end
    end
end
