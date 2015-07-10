# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(user_name: 'ifriedman')
User.create(user_name: 'ebosch')
User.create(user_name: 'Batman')

Poll.create(title: 'Fruit', author_id: 2)
Poll.create(title: 'Pets', author_id: 1)

Question.create(text: 'What is the best fruit?', poll_id: 1)
Question.create(text: 'What is the biggest fruit?', poll_id: 1)
Question.create(text: 'What animals make the best pets?', poll_id: 2)

AnswerChoice.create(text: 'Apples', question_id: 1)
AnswerChoice.create(text: 'Bananas', question_id: 1)
AnswerChoice.create(text: 'Kiwis', question_id: 1)
AnswerChoice.create(text: 'Lemons', question_id: 1)

AnswerChoice.create(text: 'Pineapple', question_id: 2)
AnswerChoice.create(text: 'Coconut', question_id: 2)
AnswerChoice.create(text: 'Cantaloupe', question_id: 2)
AnswerChoice.create(text: 'Watermelon', question_id: 2)

AnswerChoice.create(text: 'Cats', question_id: 3)
AnswerChoice.create(text: 'Dogs', question_id: 3)
AnswerChoice.create(text: 'Cows', question_id: 3)
AnswerChoice.create(text: 'Lizards', question_id: 3)

Response.create(user_id: 2, answer_choice_id: 10)
Response.create(user_id: 3, answer_choice_id: 9)
