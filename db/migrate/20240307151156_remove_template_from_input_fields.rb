class RemoveTemplateFromInputFields < ActiveRecord::Migration[7.1]
  def change
    remove_reference :input_fields, :template, null: false, foreign_key: true
  end
end
