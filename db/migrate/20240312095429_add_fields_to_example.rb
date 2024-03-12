class AddFieldsToExample < ActiveRecord::Migration[7.1]
  def change
    rename_column :examples, :intermediate_content, :chatgpt_keys
  end
end
