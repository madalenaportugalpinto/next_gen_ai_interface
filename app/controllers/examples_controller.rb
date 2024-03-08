class ExamplesController < ApplicationController

  def new
    @template = Template.find(params[:template_id])
    @example = Example.new
  end

  def edit
    @example = Example.find(params[:id])
    @template = @example.template
    @example_fields = @example.example_fields
    p "************ **************"
    p @example_fields
  end

  def create
    @example = Example.new(example_params)
    @example.template = Template.find(params[:template_id])
    @example.save!

    @output = Output.create(template: @template)
    #aqui vamos fazer @output.content = conteudo com as keys


    redirect_to edit_example_path(@example)
  end

  def update
    @example = Example.find(params[:id])
    @template = @example.template

    puts "!!!!!!!! !!!!!!!!"
    p @example.example_fields

    ## quando o example for updated ou seja finalizado
    #criamos um output
    @output = Output.create(template: @template)
    # a seguir criamos os input fields baseados nos example_fields mas sem o value
    @example.example_fields.each do |example_field|
      p params[:example][:example_fields].include? example_field.key

      puts "***** *******", example_field.key, example_field.id

      InputField.create(output: @output, key: example_field.key)
    end
    redirect_to edit_output_path(@output)

  end

  private

  def example_params
    params.require(:example).permit(:content, :template_id)
  end
end
