class Output < ApplicationRecord
  belongs_to :template
  has_many :input_fields

  def generate_output
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "given #{template.example.content}, #{@input_fields.key} and #{@input_fields.value} replace the keys for the values"}]
    })
    string = chaptgpt_response["choices"][0]["message"]["content"]
  end
end
