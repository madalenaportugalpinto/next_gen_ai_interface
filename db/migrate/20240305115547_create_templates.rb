class CreateTemplates < ActiveRecord::Migration[7.1]
  def change
    create_table :templates do |t|
      t.string :title
      t.text :description
      t.string :prompt
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
