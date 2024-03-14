class ExampleField < ApplicationRecord
  belongs_to :example
  has_many :input_fields, dependent: :destroy

  scope :active, -> { where(active: true) }
  scope :notactive, -> { where(active: false) }

  normalizes :key, with: ->(key) { key.parameterize.underscore.strip }
end
