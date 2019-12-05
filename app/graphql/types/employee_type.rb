# frozen_string_literal: true

module Types
  class EmployeeType < Types::BaseObject
    graphql_name 'employee'
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
        _args[:sort_date] == 'ASC' ? object.expenses.order(created_at: :asc) : object.expenses.order(created_at: :desc)
      elsif _args[:sort_amount]
        _args[:sort_amount] == 'ASC' ? object.expenses.order(amount: :asc) : object.expenses.order(amount: :desc)
      elsif !_args[:awaiting_approval].nil?
        _args[:awaiting_approval] ? object.expenses.where('approved IS ?', nil) : object.expenses.where('approved IS NOT ?', nil)
      else
        object.expenses
      end
    end
  end
end
