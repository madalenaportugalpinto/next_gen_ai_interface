class ExamplesController < ApplicationController

  def new
    @template = Template.find(params[:template_id])
    @example = Example.new
  end

  def edit
    @example = Example.find(params[:id])
    @template = @example.template
    @example_fields = @example.example_fields
  end

  def create
    @example = Example.new(example_params)
    @example.template = Template.find(params[:template_id])
    @example.save
    redirect_to edit_example_path(@example)
  end

  def update
    @example = Example.find(params[:id])
    @example.update(example_params)
    redirect_to new_template_output_path(@example.template)
  end

  private

  def example_params
    params.require(:example).permit(:content, :template_id, example_fields_attributes: [:active, :id])
  end
end
