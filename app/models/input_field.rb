class InputField < ApplicationRecord
  belongs_to :output

  validates :value, presence: true, length: { maximum: 50 }
end
