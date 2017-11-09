defmodule Blog.Social.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :post_id, :integer
    field :author, :string
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:author, :body])
    |> validate_required([:author, :body])
  end
end
