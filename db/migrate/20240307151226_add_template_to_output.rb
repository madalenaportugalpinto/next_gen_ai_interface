class AddTemplateToOutput < ActiveRecord::Migration[7.1]
  def change
    add_reference :outputs, :template, null: false, foreign_key: true
  end
end
