class Template < ApplicationRecord
  belongs_to :user
  has_one :example, dependent: :destroy
  has_many :example_fields, through: :example
  has_many :outputs, dependent: :destroy
  has_many :input_fields, through: :outputs
end
