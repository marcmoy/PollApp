# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(:user_name => Faker::Name.name)
User.create!(:user_name => Faker::Name.name)
User.create!(:user_name => Faker::Name.name)
User.create!(:user_name => Faker::Name.name)

Poll.create!(title: "Poll 1", author_id: 1)
Poll.create!(title: "Poll 2", author_id: 2)

Question.create!(text: "Is this question 1?", poll_id: 1)
Question.create!(text: "Is this question 2?", poll_id: 2)

AnswerChoice.create!(question_id: 1, text: "Yes")
AnswerChoice.create!(question_id: 1, text: "No")
AnswerChoice.create!(question_id: 1, text: "Maybe")

AnswerChoice.create!(question_id: 2, text: "Yes")
AnswerChoice.create!(question_id: 2, text: "No")
AnswerChoice.create!(question_id: 2, text: "Maybe")

Response.create!(answer_id: 1, user_id: 1)
Response.create!(answer_id: 2, user_id: 2)
Response.create!(answer_id: 3, user_id: 3)
