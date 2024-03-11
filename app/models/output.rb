class Output < ApplicationRecord
  belongs_to :template
  has_many :input_fields, dependent: :destroy

  accepts_nested_attributes_for :input_fields

  def parse_input_fields
    hash_input_fields = {}
    input_fields.each do |input_field|
      hash_input_fields.store(input_field.key, input_field.value)
    end
    return hash_input_fields
  end

  def generate_output_content
    # precisamos de 3 coisas
    # precisamos do content
    # precisamos dos inputs fields
    # prompt
    # se o content ja tiver as keys no texto\
    #atraves do output ir buscar todos os input values e encontrar os que fazem match
    # das keys
    # pedir no prompt para substituir key - key por value
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "given #{template.example.content} #{parse_input_fields} replace the keys for the values in the first text and get a full text"}]
    })
    result = chaptgpt_response["choices"][0]["message"]["content"]
    update(content: result)
  end
end
