module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :employees,
          [Types::ItemType],
          null: false,
          description: "Returns a list of all employee objects"
    def employees
      Employee.all
    end

  end
end
