module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :employees,
          [Types::EmployeeType],
          null: false,
          description: "Returns a list of all employee objects"

    def employees
      Employee.all
    end

    field :employee,
          [Types::EmployeeType],
          null: false,
          description: "Returns a single employee object"

    def employee
      Employee.find_by(:id)
    end

    field :expenses,
          [Types::ExpenseType],
          null: false,
          description: "Returns a list of all expense objects"

    def expenses
      Expense.all
    end

    field :expense, Types::ExpenseType, null: false, description: "Returns a single expense object" do
      argument :id, String, required: true
    end

    def expense(id)
      Expense.find_by(uuid: id)
    end

  end
end
