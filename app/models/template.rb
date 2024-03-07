class Template < ApplicationRecord
  belongs_to :user
  has_one :example
  has_many :example_fields, through: :example
end
