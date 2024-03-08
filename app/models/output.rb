class Output < ApplicationRecord
  belongs_to :template
  has_many :input_fields, dependent: :destroy

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
    @input_fields
    raise
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "given #{template.example.content}, #{@input_fields.key} and #{@input_fields.value} replace the keys for the values"}]
    })
    string = chaptgpt_response["choices"][0]["message"]["content"]
    update(content: string)
  end
end
