require "json"

class Example < ApplicationRecord
  belongs_to :template
  has_many :example_fields, dependent: :destroy

  accepts_nested_attributes_for :example_fields

  validates :content, presence: true, length: { minimum: 80 }

  def content_with_active_fields_only
    sanitized_content = content

    # For each inactive example field we need to replace <key> with the value
    example_fields.notactive.each do |field|
      sanitized_content.gsub!(/<#{field.key}>/, field.value)
    end

    sanitized_content
  end


  def generate_example_field
    client = OpenAI::Client.new

    example_fields.destroy_all # just in case

    self.initial_content = content
    self.initial_prompt = "Given #{initial_content}, create a JSON object with one level only named 'example_field'
    that follows a standardized format. The output should consist of key-value pairs,
    with each key representing an information keyword extracted from the text,
    and the corresponding value providing relevant information associated with that keyword.
    Ensure the JSON object adheres to a consistent and well-defined structure."
    save

    chaptgpt_response = client.chat(parameters: {
      model: "gpt-4",
      messages: [{ role: "user", content: initial_prompt }]
    })
    json_string = chaptgpt_response["choices"][0]["message"]["content"]

    update(chatgpt_keys: json_string)

    ruby_object = JSON.parse(json_string)
    key_values = ruby_object["example_field"]

    key_values.each do |key, value|
      example_fields.create!(key:, value:)
    end

    generate_content_example
  end

  def generate_content_example
    client = OpenAI::Client.new
    self.intermediate_prompt = "given #{content}, in this text replace each value
    for the corresponding key like <key>considering this json object:
    #{example_fields.pluck(:key, :value).to_h.to_json} like <key>, return me a text"

    save

    chaptgpt_response = client.chat(parameters: {
      model: "gpt-4",
      messages: [{ role: "user", content: intermediate_prompt}]
    })
    output_from_api = chaptgpt_response["choices"][0]["message"]["content"]

    update(content: output_from_api)
  end
end
