# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Game.destroy_all
Post.destroy_all
UsersGame.destroy_all
# Users
nicole = User.create(name: "Nicole", username: "Nicole", password: "nicole")
mia = User.create(name: "Mia", username: "Mia", password: "mia")
alice = User.create(name: "Alice", username: "Alice", password: "alice")

# Games
g1 = Game.create(title: "YA Bingo", rules: "5 in a row is a bingo", score: "Nicole: 10pts", tasks: ["1", "2", "3", "4", "5", "1", "2", "3", "4", "5", "1", "2", "3", "4", "5", "1", "2", "3", "4", "5", "1", "2", "3", "4", "5"], host: nicole.id)
g2 = Game.create(title: "Harry Potter Bingo", rules: "5 in a row is a bingo", score: "Nicole: 10pts", tasks: ["1", "2", "3", "4", "5", "1", "2", "3", "4", "5", "1", "2", "3", "4", "5", "1", "2", "3", "4", "5", "1", "2", "3", "4", "5"], host: mia.id)


p1 = Post.create(content: "Good luck to all!", ctype: "comment", user_id: nicole.id, game_id: g1.id)
p2 = Post.create(content: "Book: Harry Potter, Criteria: Read A Book by JK Rowling, Pages: 500", ctype: "point", user_id: mia.id, game_id: g1.id)
p3 = Post.create(content: "Good luck to all!", ctype: "comment", user_id: alice.id, game_id: g2.id)
p4 = Post.create(content: "Book: Harry Potter, Criteria: Read A Book by JK Rowling, Pages: 500", ctype: "point", user_id: nicole.id, game_id: g2.id)

UsersGame.create(game_id: g1.id, user_id: nicole.id)
UsersGame.create(game_id: g1.id, user_id: alice.id)
UsersGame.create(game_id: g1.id, user_id: mia.id)
UsersGame.create(game_id: g2.id, user_id: nicole.id)
UsersGame.create(game_id: g2.id, user_id: alice.id)
UsersGame.create(game_id: g2.id, user_id: mia.id)
