class ExamplesController < ApplicationController

  def new
    @template = Template.find(params[:template_id])
    @example = Example.new
  end

  def create
    @example = Example.new(example_params)
    @template = Template.find(params[:example][:template_id])
    @example.user_id = current_user.id
    @example.save
    redirect_to templates_path(@template)
    render :show
  end

  private

  def example_params
    params.require(:example).permit(:content, :template_id)
  end
end
