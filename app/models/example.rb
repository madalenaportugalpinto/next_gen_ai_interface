require "json"

class Example < ApplicationRecord
  belongs_to :template
  has_many :example_fields, dependent: :destroy
  after_create :generate_example_field

  def generate_example_field
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "given #{content}, give me the key value pairs of it in a json with the name example_field"}]
    })
    json_string = chaptgpt_response["choices"][0]["message"]["content"]
    ruby_object = JSON.parse(json_string)
    ruby_object["example_field"].each do |key, value|
      ExampleField.create!(key: key, value: value, example: self)
    end
    generate_content_example(ruby_object)
  end

  def generate_content_example(ruby_object)
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "#{content}, give me a full text with a descriptive key value pairs of #{ruby_object["example_field"].keys}} that can change including the recipient where in the text the values are replaced by the keys like <key>"}]
      })
      output_from_api = chaptgpt_response["choices"][0]["message"]["content"]
    update(content: output_from_api)
  end
end
