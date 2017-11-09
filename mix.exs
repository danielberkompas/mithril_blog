defmodule Blog.Umbrella.Mixfile do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  defp deps do
    [{:ex_doc, ">= 0.0.0", only: [:dev, :test]}]
  end
end
