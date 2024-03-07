class OutputsController < ApplicationController

  def show
    #vemos o output final
    @output = Output.find(params[:id])
    @output.content
  end

  def edit
    # aqui vamos fazer um form para fazer update ao content do output
    # e dar valores aos input fields (já devem ter keys)
    @output = Output.find(params[:id])
    @template = @output.template
    @input_fields = @output.input_fields
  end

  def update
    #gravar as alteraçoes
    @output.content = generate_output
  end
end
