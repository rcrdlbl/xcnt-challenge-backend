module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # Employee Fields

    field :employees,
          [Types::EmployeeType],
          null: false,
          description: "Returns a list of all employee objects"

    def employees
      Employee.all
    end

    field :employees_connection, Types::EmployeeType.connection_type, null: false, description: "Paginated Version of employees field"

    def employees_connection(**_args)
      Employee.all
    end

    field :employee, Types::EmployeeType, null: false, description: "Returns a single employee object" do
      argument :id, ID, required: true
    end

    def employee(id:)
      Employee.find(id)
    end

    # Expense Fields

    field :expenses, Types::ExpenseType.connection_type, null: false, description: "Paginated Version of expenses field" do
      argument :sort_date, String, required: false
      argument :sort_amount, String, required: false
      argument :awaiting_approval, Boolean, required: false
      argument :employee_id, ID, required: false
    end

    def expenses(**_args)
      expenses = Expense.all
      if _args[:employee_id]
        expenses = Employee.find(_args[:employee_id]).expenses
      end

      if _args[:sort_date]
        _args[:sort_date] == "ASC" ? expenses.order(created_at: :asc) : expenses.order(created_at: :desc)
      elsif _args[:sort_amount]
        _args[:sort_amount] == "ASC" ? expenses.order(amount: :asc) : expenses.order(amount: :desc)
      elsif _args[:awaiting_approval] != nil
        _args[:awaiting_approval] ? expenses.where("approved IS ?", nil) : expenses.where("approved IS NOT ?", nil)
      else
        expenses
      end
    end

    field :expense, Types::ExpenseType, null: false, description: "Returns a single expense object" do
      argument :id, ID, required: true
    end

    def expense(id:)
      Expense.find(id)
    end

  end
end
