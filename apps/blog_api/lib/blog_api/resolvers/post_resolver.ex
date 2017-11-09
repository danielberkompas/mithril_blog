defmodule BlogAPI.PostResolver do
  @moduledoc """
  A GraphQL resolver for posts.
  """

  alias Blog.Writing

  def get(%{id: id}, _context) do
    {:ok, Writing.get_post!(id)}
  end

  def list(_args, _context) do
    {:ok, Writing.list_posts()}
  end
end