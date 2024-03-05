class CreateOutputs < ActiveRecord::Migration[7.1]
  def change
    create_table :outputs do |t|
      t.text :prompt
      t.text :content

      t.timestamps
    end
  end
end
