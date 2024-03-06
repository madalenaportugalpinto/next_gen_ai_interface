class TemplatesController < ApplicationController

  def index
    @templates = Template.all
  end

  def show
    @template = Template.find(params[:id])
    @example = @template.example if @template.example


  end

  def new
    @template = Template.new
  end

  def edit
    @template = Template.find(params[:id])
  end

  def create
    @template = Template.new(template_params)
    @template.user_id = current_user.id
    @template.save
    redirect_to new_template_example_path(@template)
  end

  def update
    @template = Template.find(params[:id])
    if @template.update(template_params)
      redirect_to @template, notice: 'Template was successfully updated.'
    else
      render :edit
    end
  end

  private

  def template_params
    params.require(:template).permit(:title, :description)
  end
end
