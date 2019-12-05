# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :updateExpenseApproved, mutation: Mutations::UpdateExpenseApproved, description: 'Takes an expense id and a boolean and changes the approved field on the expense object'
  end
end
