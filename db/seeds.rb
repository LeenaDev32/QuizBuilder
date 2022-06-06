# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(name: 'Joe Bloggs', role: :admin, email: 'joe@yopmail.com', password: 'password')
u2 = User.create(name: 'Jane Doe', role: :user, email: 'jane@yopmail.com', password: 'password')

q = Quiz.create(name: 'Quiz 1', user_id: u1.id)
qu1 = Question.create(title: 'How tall are you?', question_type: "number", quiz_id: q.id)
qu2 = Question.create(title: 'How much do you weigh?', question_type: "number", quiz_id: q.id)

Answer.create(response: '180cm', question_id: qu1.id, user_id: u2.id, quiz_id: q.id)
