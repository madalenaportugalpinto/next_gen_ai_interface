puts "Cleaning database..."

InputField.destroy_all
ExampleField.destroy_all
Output.destroy_all
Example.destroy_all
Template.destroy_all

puts "Creating template 1 and example 1"

# Template.create!(
#   title: "My Emails",
#   description: "These are my grades emails",
#   user_id: User.last.id,
#   example_attributes: {
#     content: "Dear Madalena, I would like to congratulate you for your A Grade in the batch 1556 of Le Wagon. Kind regards, Dennis"
#   }
# )

# Example.last.generate_example_field

template = Template.create!(
  title: "My Applications",
  description: "These are my applications emails",
  user_id: User.last.id,
  example_attributes: {
    content: "Dear <recipient>, I am writing to express my interest in the <job_position>
     position at <company>, as advertised on <job_platform>.
     With <years_experience> years of experience in <area>.
     For example, in my previous role,
     I <accomplishments>. I look forward to the possibility of contributing to your team.
     Warm regards, <sender>"
  }
)

template.example.example_fields.create!(key: "recipient", value: "Mr. Smith")
template.example.example_fields.create!(key: "job_position", value: "Web Developer")
template.example.example_fields.create!(key: "company", value: "Microsoft")
template.example.example_fields.create!(key: "job_platform", value: "LinkedIn")
template.example.example_fields.create!(key: "years_experience", value: "3")
template.example.example_fields.create!(key: "area", value: "Web Development")
template.example.example_fields.create!(key: "accomplishments", value: "made an interface for AI")
template.example.example_fields.create!(key: "sender", value: "Renato")



puts "Created #{Template.count} templates"

puts "Finished!"
