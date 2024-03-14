class Output < ApplicationRecord
  belongs_to :template
  has_many :input_fields, dependent: :destroy

  accepts_nested_attributes_for :input_fields
  validates_associated :input_fields

  def generate_output_content
    client = OpenAI::Client.new
    input_fields_hash = template.example_fields.pluck(:key, :value).to_h
                                .merge(input_fields.pluck(:key, :value).to_h)
                                .to_json

    prompt = "given #{template.example.content}, and the following JSON object:
    #{input_fields_hash} replace the keys for the values in the provided text and
    get a full text without any signals"

    update(prompt:)

    chaptgpt_response = client.chat(
      parameters: {
        model: 'gpt-4',
        messages: [{ role: "user", content: prompt }]
      }
    )
    result = chaptgpt_response["choices"][0]["message"]["content"]
    update(content: result)
  end
end
