class CreateExampleFields < ActiveRecord::Migration[7.1]
  def change
    create_table :example_fields do |t|
      t.string :key
      t.string :value
      t.references :example, null: false, foreign_key: true

      t.timestamps
    end
  end
end
