module Types
  class EmployeeType < Types::BaseObject
    graphql_name "employee"
    field :uuid, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :expenses, Types::ExpenseType, null: false
  end
end
