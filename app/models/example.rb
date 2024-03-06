class Example < ApplicationRecord
  belongs_to :template

  def generate_example_field
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "given #{content}, give me the key value pairs of it in a ruby hash with the name example-field"}]
    })
    chaptgpt_response["choices"][0]["message"]["content"].each do |key, value|
      ExampleField.new(key: key, value: value)
    end
  end
end
