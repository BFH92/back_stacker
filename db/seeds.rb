# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
size = ["0..9", "10..49", "50..249", "250..+"]
10.times do 
  company = Company.create!(
    name: Faker::Company.name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    github_link: "https://github.com/",
    website_link: Faker::Internet.domain_name(domain: "supercompany"),
    staff_size: size.sample,
    is_it_recruiting: Faker::Boolean.boolean,
    company_category_id: Faker::Number.between(from: 1, to: 5)
  )
end
