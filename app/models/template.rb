class Template < ApplicationRecord
  belongs_to :user
  has_many :examples
end
