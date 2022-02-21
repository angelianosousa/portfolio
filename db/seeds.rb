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
   first: {
    title: "Finantial System", 
    production_link: "https://finantial-system.herokuapp.com/users/sign_...", 
    repository_link: "https://github.com/angelianosousa/finantial_system"
    },
  second: { 
    title: "Personal Agenda",
    production_link: "https://personalagenda.herokuapp.com/",
    repository_link: "https://github.com/angelianosousa/personal_agenda"
  }
]

projects.each do |index|
  Project.create(
    title: project[index][:title],
    production_link: project[index][:production_link],
    repository_link: project[index][:repository_link]
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
