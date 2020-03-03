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
lily = User.create(name: "Lily", username: "lily13", password: "lily")

board_obj = {
  1 => {description: "read a book that starts with A", completed: [alice.id]},
  2 => {description: "read a book that starts with B", completed: []},
  3 => {description: "read a book that starts with A", completed: []},
  4 => {description: "read a book that starts with B", completed: []},
  5 => {description: "read a book that starts with A", completed: [lily.id]},
  6 => {description: "read a book that starts with B", completed: []},
  7 => {description: "read a book that starts with A", completed: [alice.id, lily.id]},
  8 => {description: "read a book that starts with B", completed: []},
  9 => {description: "read a book that starts with A", completed: [lily.id]},
  10 => {description: "read a book that starts with B", completed: []},
  11 => {description: "read a book that starts with A", completed: []},
  12 => {description: "read a book that starts with B", completed: [alice.id,lily.id]},
  13 => {description: "read a book that starts with A", completed: []},
  14 => {description: "read a book that starts with B", completed: []},
  15 => {description: "read a book that starts with A", completed: []},
  16 => {description: "read a book that starts with B", completed: []},
  17 => {description: "read a book that starts with A", completed: [lily.id, alice.id]},
  18 => {description: "read a book that starts with B", completed: []},
  19 => {description: "read a book that starts with A", completed: []},
  20 => {description: "read a book that starts with B", completed: []},
  21 => {description: "read a book that starts with A", completed: []},
  22 => {description: "read a book that starts with B", completed: [alice.id, lily.id]},
  23 => {description: "read a book that starts with A", completed: []},
  24 => {description: "read a book that starts with B", completed: []},
  25 => {description: "read a book that starts with B", completed: [lily]}
}
board_obj = board_obj.to_json

# Games
g1 = Game.create(title: "YA Bingo", rules: "5 in a row is a bingo", score: "Nicole: 10pts", tasks: board_obj, host: nicole.id)
g2 = Game.create(title: "Harry Potter Bingo", rules: "5 in a row is a bingo", score: "Nicole: 10pts", tasks: board_obj, host: mia.id)


p1 = Post.create(content: "Good luck to all!", ctype: "comment", user_id: nicole.id, game_id: g1.id)
p2 = Post.create(content: "Book: Harry Potter, Criteria: Read A Book by JK Rowling, Pages: 500", ctype: "point", user_id: mia.id, game_id: g1.id)
p3 = Post.create(content: "Good luck to all!", ctype: "comment", user_id: alice.id, game_id: g2.id)
p4 = Post.create(content: "Book: Harry Potter, Criteria: Read A Book by JK Rowling, Pages: 500", ctype: "point", user_id: nicole.id, game_id: g2.id)

UsersGame.create(game_id: g1.id, user_id: nicole.id)
UsersGame.create(game_id: g1.id, user_id: alice.id)
UsersGame.create(game_id: g1.id, user_id: lily.id)
UsersGame.create(game_id: g1.id, user_id: mia.id)
UsersGame.create(game_id: g2.id, user_id: nicole.id)
UsersGame.create(game_id: g2.id, user_id: alice.id)
UsersGame.create(game_id: g2.id, user_id: mia.id)
UsersGame.create(game_id: g2.id, user_id: lily.id)
