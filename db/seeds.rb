# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = [ {name: "Philip"}, {name: "Pablo"}, {name: "Steven"} ]

questions = [ {title: 'What is the meaning of life? Is there even any meaning to it at all? Jesus Christ.', description: 'The answer is not 42, I already know that. So tell me what it means, or else you and your immediate
family will be in grave danger. I am not kidding. Give me the answer to this question, RIGHT NOW', user_id: 1}, {title: 'Why are french fries so salty? They are still tasty, through, so everything is fine.',
description: 'Man I love french fries. But holy crap they are salty as hell. The salt is too much, I cannot handle it. So why are they so salty? And what can we do to reduce their salt content?
There must be a way. Tell me. Tell me now.', user_id: 2} ]

users.each do |things|
  User.create(things)
end

questions.each do |wow|
  Question.create(wow)
end
