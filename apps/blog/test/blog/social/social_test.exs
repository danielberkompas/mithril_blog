defmodule Blog.SocialTest do
  use Blog.DataCase

  alias Blog.Social

  describe "comments" do
    alias Blog.Social.Comment

    @valid_attrs %{author: "some author", body: "some body"}
    @update_attrs %{author: "some updated author", body: "some updated body"}
    @invalid_attrs %{author: nil, body: nil}

    def comment_fixture(attrs \\ %{}) do
      {:ok, comment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Social.create_comment()

      comment
    end

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert Social.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Social.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      assert {:ok, %Comment{} = comment} = Social.create_comment(@valid_attrs)
      assert comment.author == "some author"
      assert comment.body == "some body"
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Social.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      assert {:ok, comment} = Social.update_comment(comment, @update_attrs)
      assert %Comment{} = comment
      assert comment.author == "some updated author"
      assert comment.body == "some updated body"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Social.update_comment(comment, @invalid_attrs)
      assert comment == Social.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Social.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Social.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Social.change_comment(comment)
    end
  end
end
