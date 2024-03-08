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



puts "Creating template 1 and example 1"
template_1 = Template.create(title: "My monthly report", description: "This is what I need to write every month", user_id: User.last.id)
Example.create(content:"Equities are still driven by a strong tech rally and the S&P 500 hit several all-time highs along the way. China had a positive month breaking out of a year-long negative trend. Bond yields picked up early in the month in the US as well as in Europe, while remaining subdued over the rest of the period. Commodities ended negative, driven by a sharp decline in natural gas prices and weaker industrial metals. The USD continued to strengthen on positive sentiment, along with cyclical currencies, such as the EUR or GBP.", template: template_1 )

puts "Creating template 2 and example 2"

template_2 = Template.create(title: "My annual report", description: "This is my annual report that i need to in every year", user_id: User.last.id )
Example.create(content:"These templates can take different forms depending on your organization’s needs, but they’ll always do one thing: break down information into straightforward categories. It’s tempting to dump a ton of data into your reports and call it a day, but you have to ensure you’re always thinking about the reader. Otherwise, you’re just sending work hours down the drain.", template: template_2 )

puts "Creating template 3 and example 3"

template_3 = Template.create(title: "My weekly report", description: "This is my weekly support that i need in all of my week", user_id: User.last.id )
Example.create(content:"Project managers and CEOs aren’t the only ones that work with monthly reports. Teams often need to have some kind of reporting workflow to keep leaders and other teams aware of what they’ve been working on. A manager will often take care of this report; though sometimes it might only be shared with a department head or a vice president. Here’s what this kind of report might look like.", template: template_3 )






puts "Created #{Template.count} templates"

puts "Finished!"
