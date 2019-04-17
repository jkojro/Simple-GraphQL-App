module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    description "root query"

    field :authors, [AuthorType], null: true do
      description "gets all authors"
    end

    def authors
      Author.all
    end
  end
end
