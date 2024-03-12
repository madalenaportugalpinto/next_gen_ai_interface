class InputFieldsController < ApplicationController

  def edit
    @input_fields = InputField.find(params[:id])
  end

  def update
    @input_field = InputField.find(params[:id])
    @input_field.update(input_field_params)
    if @input_field.save
      redirect_to edit_output_path(@input_field.output)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def input_field_params
    params.require(:input_field).permit(:key, :value)
  end
end
