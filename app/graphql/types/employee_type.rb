module Types
  class EmployeeType < Types::BaseObject
    graphql_name "employee"
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :expenses, Types::ExpenseType.connection_type, null: false do
      argument :sort_date, String, required: false
      argument :sort_amount, String, required: false
      argument :awaiting_approval, Boolean, required: false
    end

    def expenses(**_args)
      if _args[:sort_date]
        _args[:sort_date] == "ASC" ? self.object.expenses.order(created_at: :asc) : self.object.expenses.order(created_at: :desc)
      elsif _args[:sort_amount]
        _args[:sort_amount] == "ASC" ? self.object.expenses.order(amount: :asc) : self.object.expenses.order(amount: :desc)
      elsif _args[:awaiting_approval] != nil
        _args[:awaiting_approval] ? self.object.expenses.where("approved IS ?", nil) : self.object.expenses.where("approved IS NOT ?", nil)
      else
        self.object.expenses
      end
    end
  end
end
