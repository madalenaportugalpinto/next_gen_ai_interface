class AddActiveToExampleFields < ActiveRecord::Migration[7.1]
  def change
    add_column :example_fields, :active, :boolean, :default => true
  end
end
