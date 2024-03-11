class ExampleField < ApplicationRecord
  belongs_to :example

  scope :active, -> { where(active: true) }
end
