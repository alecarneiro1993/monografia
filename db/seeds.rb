# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

['aluno', 'professor', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

@user = User.find(1)
@user.questions.new(title: "Title 1", description: "This is a description to check if truncates works or not, if it doesnt, you will see this full text").save!
