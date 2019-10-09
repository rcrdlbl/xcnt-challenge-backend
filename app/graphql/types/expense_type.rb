module Types
  class ExpenseType < Types::BaseObject
    graphql_name "expense"
    field :uuid, ID, null: false
    field :description, String, null: false
    field :amount, Integer, null: false
    field :currency, String, null: false
    field :approved, Boolean, null: true
    field :created_at, String, null: false
    field :employee, Types::EmployeeType, null: false
  end
end
