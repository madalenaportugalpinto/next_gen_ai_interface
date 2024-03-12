class OutputsController < ApplicationController
  before_action :set_template, only: [:new, :create]

  def new
    @output = Output.new(template: @template)
    @example = @template.example

    @example.example_fields.active.each do |field|
      @example.content = @example.content.gsub(field.key, field.value)
      @output.input_fields << InputField.new(key: field.value)
    end
  end

  def create
    @output = Output.new(output_params)
    @output.template = @template
    @example = @template.example

    if @output.save
      @output.generate_output_content
      redirect_to @output
    else
      render :new
    end
  end

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
  end

  def update
    #gravar as alteraçoes
    @output = Output.find(params[:id])
    @template = @output.template
    @example = @template.example

    if @output.update(output_params)
      @output.generate_output_content
      redirect_to @output
    else
      render :edit
    end
  end

  private

  def output_params
    params.require(:output).permit(:content, :prompt, input_fields_attributes: [:key, :value, :id])
  end

  def set_template
    @template = Template.find(params[:template_id])
  end

end
