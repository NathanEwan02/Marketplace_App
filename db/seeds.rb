# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Event.destroy_all
Game.destroy_all
Team.destroy_all



games = [
    Game.create!(name: "Super Smash Bros Ultimate"),
    Game.create!(name: "Call of Duty: Modern Warfare"),
    Game.create!(name: "Counter Strike Global Offense"),
    Game.create!(name: "Valorant")
]

events = [
    Event.create!(name: "Brisbane Brawl", date: "2021-12-26", location: "12 Duchess Street Brisbane", game_id: 3),
    Event.create!(name: "Valorant Recruits", date: "2022-01-15", location: "12 Duchess Street Brisbane", game_id: 4),
    Event.create!(name: "COD DeathMatch", date: "2021-01-19", location: "59 Grover Road Sydney", game_id: 2),
    Event.create!(name: "FGC Recruitment", date: "2021-03-24", location: "34 Pinfold Court GoldCoast", game_id: 1)
]

Team.create!(name: 'The Spitfires', games: [games[2], games[3]], events: [events[0], events[1]])
Team.create!(name: 'The Animals', games: [games[0], games[2]], events: [events[2]])
Team.create!(name: 'MorningStar', games: [games[3], games[1]], events: [events[3]])
Team.create!(name: 'Hunters', games: [games[2]], events: [events[1], events[0]])

Role.create!(name: 'manager')
Role.create!(name: 'organiser')

User.create!(email: 'foo@bar.com', password: 'password')
User.first.update(team_id: 1)
User.first.add_role :manager


