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
InputField.destroy_all
ExampleField.destroy_all
Output.destroy_all
Example.destroy_all
Template.destroy_all



puts "Creating template..."
luca = {title: "My monthly report", description: "This is what I need to write every month", user_id: User.last.id}
tommy = {title: "My anual report", description: "This is what I need to write every year", user_id: User.last.id}

[luca, tommy].each do |attributes|
  template = Template.create!(attributes)
  Example.create!(content: "Equities are still driven by a strong tech rally and the S&P 500 hit several all-time highs along the way. China had a positive month breaking out of a year-long negative trend. Bond yields picked up early in the month in the US as well as in Europe, while remaining subdued over the rest of the period. Commodities ended negative, driven by a sharp decline in natural gas prices and weaker industrial metals. The USD continued to strengthen on positive sentiment, along with cyclical currencies, such as the EUR or GBP.", template_id: Template.last.id)
  puts "Created #{template.title}"
end
puts "Finished!"
