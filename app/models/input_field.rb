class InputField < ApplicationRecord
  belongs_to :output
  belongs_to :example_field

  validates :value, presence: true, length: { maximum: 50 }
end
