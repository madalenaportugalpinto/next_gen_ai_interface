class ExamplesController < ApplicationController

  def index
  end

  def new
    @template = Template.find(params[:template_id])
    @example = Example.new
  end

  def create
    @example = Example.new(example_params)
    @example.template = Template.find(params[:template_id])
    @example.save!
    redirect_to templates_path(@template)
  end

  private

  def example_params
    params.require(:example).permit(:content, :template_id)
  end
end
