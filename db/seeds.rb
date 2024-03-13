puts "Cleaning database..."

InputField.destroy_all
ExampleField.destroy_all
Output.destroy_all
Example.destroy_all
Template.destroy_all

puts "Creating template 1 and example 1"

Template.create!(
  title: "My Emails",
  description: "These are my grades emails",
  user_id: User.last.id,
  example_attributes: {
    content: "Dear Madalena, I would like to congratulate you for your A Grade in the batch 1556 of Le Wagon. Kind regards, Dennis"
  }
)

Example.last.generate_example_field

puts "Created #{Template.count} templates"

puts "Finished!"
