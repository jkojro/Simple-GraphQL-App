module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    description "root query"

    field :authors, [AuthorType], null: true do
      description "gets all authors"
    end

    field :author, AuthorType, null: true do
      description "gets author by id"
      argument :id, ID, required: true
    end

    field :books, [BookType], null: true do
      description "gest all books"
    end

    field :book, BookType, null: true do
      description "gets bookmby id"
      argument :id, ID, required: true
    end

    def authors
      Author.all
    end

    def author(id:)
      Author.find(id)
    end

    def books
      Book.all
    end

    def book(id:)
      Book.find(id)
    end
  end
end
