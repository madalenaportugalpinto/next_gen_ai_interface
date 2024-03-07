class ExamplesController < ApplicationController

  def new
    @template = Template.find(params[:template_id])
    @example = Example.new
  end

  def edit
    @example = Example.find(params[:id])
  end

  def create
    @example = Example.new(example_params)
    @example.template = Template.find(params[:template_id])
    @example.save!
    redirect_to edit_example_path(@example)
  end

  def update
    
  end

  private

  def example_params
    params.require(:example).permit(:content, :template_id)
  end
end
