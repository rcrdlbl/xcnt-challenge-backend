module Mutations
  class UpdateExpenseApproved < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    field :expense, Types::ExpenseType, null: false

    # TODO: define arguments
    # argument :name, String, required: true
    argument :id, ID, required: true
    argument :approved, Boolean, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
    def resolve(id:, approved:)
      expense = Expense.find(id)
      return {} unless expense

      expense.approved = approved
      if expense.save
        { expense: expense }
      else
        { errors: expense.errors.full_messages }
      end
    end
  end
end
