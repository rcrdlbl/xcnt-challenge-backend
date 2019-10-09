module Mutations
  class UpdateExpenseApproved < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    field :expense, Types::ExpenseType, null: false

    # TODO: define arguments
    # argument :name, String, required: true
    argument :uuid, String, required: true
    argument :approved, Boolean, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
  end
end
