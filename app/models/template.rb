class Template < ApplicationRecord
  belongs_to :user
  has_one :example
end
