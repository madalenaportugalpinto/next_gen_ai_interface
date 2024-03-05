class CreateExamples < ActiveRecord::Migration[7.1]
  def change
    create_table :examples do |t|
      t.text :content
      t.references :template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
