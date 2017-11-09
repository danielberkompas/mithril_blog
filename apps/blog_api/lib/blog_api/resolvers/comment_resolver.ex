defmodule BlogAPI.CommentResolver do
  @moduledoc """
  A GraphQL resolver for comments.
  """

  alias Blog.Social

  def get(%{id: id}, _context) do
    {:ok, Social.get_comment!(id)}
  end

  def list(_args, _context) do
    {:ok, Social.list_comments()}
  end
end