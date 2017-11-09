defmodule BlogAPI.Schema.Types do
  @moduledoc """
  Type definitions for Blog's GraphQL schema. For more
  info, see: https://hexdocs.pm/absinthe/Absinthe.html
  """

  use Absinthe.Schema.Notation

  import BlogAPI.Schema.Assoc

  alias Blog.{
    Social,
    Writing
  }

  @desc "Represents a Blog post."
  object :post do
    field :id, :integer
    field :title, :string
    field :body, :string

    @desc "Comments made about this post."
    field :comments, list_of(:comment), 
      resolve: assoc(:many, {:id, :post_id}, &Social.list_comments/1)
  end

  @desc "Represents a comment on a blog post."
  object :comment do
    field :id, :integer
    field :author, :string
    field :body, :string

    @desc "The post this comment was made about."
    field :post, :post, 
      resolve: assoc(:one, {:post_id, :id}, &Writing.list_posts/1)
  end
end