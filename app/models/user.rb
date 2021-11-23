class User < ApplicationRecord
  after_create :set_role

  rolify

  belongs_to :team, optional: true
  has_many :user_games, dependent: :destroy
  has_many :games, through: :user_games
  has_many :event_users, dependent: :destroy
  has_many :events, through: :event_users
  has_many :teams, inverse_of: :manager
  has_many :events, inverse_of: :creator

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  def set_role
    self.add_role(:player)
  end

end
