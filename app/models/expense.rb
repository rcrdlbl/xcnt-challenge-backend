class Expense < ApplicationRecord
  self.primary_key = :uuid
  belongs_to :employee
end
