# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 5.times do 
#   Tecnology.create(
#     name: Faker::ProgrammingLanguage.name,
#     image_link: Faker::LoremFlickr.image(size: "50x60", search_terms: ['tecnology'])
#   )
# end

User.create(email:"user@user.com", password:"user123", password_confirmation:"user123")

stacks = ["React", "Ruby on Rails", "Angular JS", "Vue JS", "Node JS"]

stacks.each do |stack|
  Stack.create(name: stack, description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Enim, fugiat optio excepturi quidem exercitationem quia ipsa ipsum laudantium ex ipsam veritatis non sit impedit? Explicabo ex facere sint ducimus est.")
end

projects = [
  title: "Finantial System", 
  production_link: "https://finantial-system.herokuapp.com/users/sign_...", 
  repository_link: "https://github.com/angelianosousa/finantial_system"
], [
  title: "Personal Agenda",
  production_link: "https://personalagenda.herokuapp.com/",
  repository_link: "https://github.com/angelianosousa/personal_agenda"
]

projects.each do |project|
  count = 0
  Project.create(
    title: project[count][:title],
    production_link: project[count][:production_link],
    repository_link: project[count][:repository_link],
    visible_on_home: true
  )
  count += 1
end

10.times do 
  Project.create(
    title: Faker::Movie.title,
    description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Enim, fugiat optio excepturi quidem exercitationem quia ipsa ipsum laudantium ex ipsam veritatis non sit impedit? Explicabo ex facere sint ducimus est.",
    production_link: Faker::Internet.url(host: 'example.com'),
    repository_link: Faker::Internet.url(host: 'example.com'),
    objectives: Faker::Lorem.paragraph_by_chars,
    learns: Faker::Lorem.sentence(word_count: 5)
  )
end

6.times do 
  ProfessionalCarreer.create(
    start_date: Faker::Date.in_date_period,
    end_date: Faker::Date.in_date_period,
    occupation: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.paragraph(sentence_count: 2),
  )
end
