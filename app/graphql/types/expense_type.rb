module Types
  class ExpenseType < Types::BaseObject
    field :uuid, ID, null: false
    field :description, String, null: false
    field :amount, Integer, null: false
    field :currency, String, null: false
    field :approved, Boolean, null: true
    field :employee, Types::EmployeeType, null: false
  end
end
