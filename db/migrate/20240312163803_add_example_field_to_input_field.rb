class AddExampleFieldToInputField < ActiveRecord::Migration[7.1]
  def change
    add_reference :input_fields, :example_field, null: false, foreign_key: true
  end
end
