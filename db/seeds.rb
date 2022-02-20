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
stacks = ["React", "Ruby on Rails", "Angular JS", "Vue JS", "Node JS"]

stacks.each do |stack|
  Stack.create(name: stack)
end

10.times do |project|
  project = Project.create(
    title: Faker::Superhero.name,
    objectives: Faker::Lorem.paragraph_by_chars,
    learns: Faker::Lorem.sentence(word_count: 5)
  )

  Stack.all.sample(rand 2..4).each do |stack|
    project.projects_stacks << stack
  end
end
