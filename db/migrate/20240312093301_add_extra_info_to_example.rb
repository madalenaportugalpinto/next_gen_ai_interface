class AddExtraInfoToExample < ActiveRecord::Migration[7.1]
  def change
    add_column :examples, :initial_content, :text
    add_column :examples, :intermediate_content, :text
    add_column :examples, :initial_prompt, :text
    add_column :examples, :intermediate_prompt, :text
  end
end
