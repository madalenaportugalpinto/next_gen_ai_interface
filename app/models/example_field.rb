class ExampleField < ApplicationRecord
  belongs_to :example

  scope :active, -> { where(active: true) }
  scope :notactive, -> { where(active: false) }
end
