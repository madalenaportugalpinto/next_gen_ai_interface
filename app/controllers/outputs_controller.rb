class OutputsController < ApplicationController

  def show
    #vemos o output final
    @output = Output.find(params[:id])
  end

  def edit
    # aqui vamos fazer um form para fazer update ao content do output
    # e dar valores aos input fields (já devem ter keys)
    @output = Output.find(params[:id])
    @template = @output.template
    @example = @template.example
    @input_fields = @output.input_fields
  end

  def update
    #gravar as alteraçoes
    @output = Output.find(params[:id])
    @template = @output.template
    generate_output_content
    redirect_to @output
  end
end
