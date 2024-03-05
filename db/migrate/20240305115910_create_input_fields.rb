class CreateInputFields < ActiveRecord::Migration[7.1]
  def change
    create_table :input_fields do |t|
      t.string :key
      t.string :value
      t.references :template, null: false, foreign_key: true
      t.references :output, null: false, foreign_key: true

      t.timestamps
    end
  end
end
