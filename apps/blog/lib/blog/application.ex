defmodule Blog.Application do
  @moduledoc """
  The Blog Application.
  """

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(Blog.Repo, []),
    ], strategy: :one_for_one, name: Blog.Supervisor)
  end
end
