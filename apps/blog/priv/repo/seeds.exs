# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blog.Factory.insert!(%Blog.SomeSchema{})

alias Blog.Factory, warn: false

for title <- ["First", "Second"] do
  post = Factory.insert!(:post, title: "#{title} Post")
  Factory.insert!(:comment, post_id: post.id, author: "Jane #{post.id}")
  Factory.insert!(:comment, post_id: post.id, author: "John #{post.id}")
end