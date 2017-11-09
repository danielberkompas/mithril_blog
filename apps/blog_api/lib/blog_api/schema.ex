defmodule BlogAPI.Schema do
  @moduledoc """
  A GraphQL schema for Blog. For more info see:
  https://hexdocs.pm/absinthe/Absinthe.html
  """

  use Absinthe.Schema

  alias BlogAPI.{
    CommentResolver,
    PostResolver
  }

  import_types Absinthe.Plug.Types
  import_types BlogAPI.Schema.Types

  query do
    @desc "Gets a post by its ID."
    field :post, :post do
      arg :id, :integer
      resolve &PostResolver.get/2
    end

    @desc "Lists all posts."
    field :posts, list_of(:post) do
      resolve &PostResolver.list/2
    end

    @desc "Gets a comment by its ID."
    field :comment, :comment do
      arg :id, :integer
      resolve &CommentResolver.get/2
    end

    @desc "Lists all comments."
    field :comments, list_of(:comment) do
      resolve &CommentResolver.list/2
    end
  end
end