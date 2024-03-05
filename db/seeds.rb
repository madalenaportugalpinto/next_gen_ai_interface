# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Template.destroy_all

puts "Creating template..."
luca = {title: "Luca", description: "First template", user_id: User.last.id}
tommy = {title: "Tommy", description: "Second template", user_id: User.last.id}

[luca, tommy].each do |attributes|
  template = Template.create!(attributes)
  puts "Created #{template.title}"
end
puts "Finished!"
