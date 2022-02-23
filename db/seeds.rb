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
  Stack.create(name: stack)
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
    repository_link: project[count][:repository_link]
  )
  count += 1
end

10.times do 
  Project.create(
    title: Faker::Movie.title,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    # photo_principal: Faker::Placeholdit.image(size: '100x100', format: 'jpg'),
    production_link: Faker::Internet.url(host: 'example.com'),
    repository_link: Faker::Internet.url(host: 'example.com')
  )
end

# 10.times do |project|
#   project = Project.create(
#     title: Faker::Superhero.name,
#     objectives: Faker::Lorem.paragraph_by_chars,
#     learns: Faker::Lorem.sentence(word_count: 5)
#   )

#   Stack.all.sample(rand 2..4).each do |stack|
#     project.projects_stacks << stack
#   end
# end
