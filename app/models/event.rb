class Event < ApplicationRecord
    resourcify 

    has_many :team_events, dependent: :destroy
    has_many :teams, through: :team_events
    belongs_to :game
    has_many :event_users, dependent: :destroy
    has_many :users, through: :event_users
    belongs_to :creator, class_name: :Team, foreign_key: 'creator_id', optional: true

    has_one_attached :image, dependent: :purge

    validates :name, presence: {message: "Please provide a title"}
    validates :date, presence: {message: "Please set a date"}
    validates :location, presence: {message: "Please provide a location"}
    validate :valid_date

    def valid_date
        if date.to_s <= Date.today.to_s
            errors.add(:date, "Date must be set in the future")
        end
    end
end
