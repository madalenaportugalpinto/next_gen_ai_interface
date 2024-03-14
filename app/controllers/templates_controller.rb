class TemplatesController < ApplicationController

  def index
    @templates = Template.all
  end

  def show
    @template = Template.find(params[:id])
    @example = @template.example if @template.example
    @example_fields = @template.example_fields
  end

  def new
    @template = Template.new(example: Example.new)
  end

  def edit
    @template = Template.find(params[:id])
  end

  def create
    @template = Template.new(template_params)
    @template.user_id = current_user.id

    if @template.save
      @template.example.generate_example_field
      redirect_to edit_example_path(@template.example)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @template = Template.find(params[:id])

    if @template.update(template_params)
      @template.example.generate_example_field if @template.example.initial_content_previously_changed?
      redirect_to edit_example_path(@template.example), notice: 'Template was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @template = Template.find(params[:id])
    @template.destroy
    redirect_to template_path, notice: "Deleted"
  end

  private

  def template_params
    params.require(:template).permit(:title, :description, example_attributes: [:id, :content, :initial_content])
  end
end
