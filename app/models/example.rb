require "json"

class Example < ApplicationRecord
  belongs_to :template
  has_many :example_fields

  after_create :generate_example_field

  accepts_nested_attributes_for :example_fields

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
    self.initial_prompt = "given #{initial_content}, return me the key value pairs of the dynamic keywords in it, in a
    json with the name example_field"
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
    self.intermediate_prompt = "#{content}, in this text replace each of the matching keys for each of corresponding values from this hash: #{example_fields.pluck(:key, :value).to_h.to_json} like <key>"
    save

    chaptgpt_response = client.chat(parameters: {
      model: "gpt-4",
      messages: [{ role: "user", content: intermediate_prompt}]
    })
    output_from_api = chaptgpt_response["choices"][0]["message"]["content"]

    update(content: output_from_api)
  end
end
