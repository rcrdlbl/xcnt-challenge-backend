class Employee < ApplicationRecord
  self.primary_key = :uuid
  has_many :expenses
end
