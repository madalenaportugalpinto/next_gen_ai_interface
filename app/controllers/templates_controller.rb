class TemplatesController < ApplicationController

  def index
    @templates = Template.all
  end

  def show

  end

  def new
    @template = Template.new
  end

  def create
    @template = Template.new(template_params)
    @template.user_id = current_user.id
    @template.save
    redirect_to templates_path
  end

  private

  def template_params
    params.require(:template).permit(:title, :description)
  end

end
