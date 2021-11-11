# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Game.destroy_all
Team.destroy_all


games = [
    Game.create!(name: "Super Smash Bros Ultimate"),
    Game.create!(name: "Call of Duty: Modern Warfare"),
    Game.create!(name: "Counter Strike Global Offense"),
    Game.create!(name: "Valorant")
]

Team.create!(name: 'The Spitfires', games: [games[2], games[3]])
Team.create!(name: 'The Animals', games: [games[2], games[3]])
Team.create!(name: 'MorningStar', games: [games[2], games[3]])
Team.create!(name: 'Hunters', games: [games[2], games[3]])

Role.create!(name: 'manager')
Role.create!(name: 'organiser')

User.create!(email: 'foo@bar.com', password: 'password')
User.first.update(team_id: 1)
User.first.add_role :manager


