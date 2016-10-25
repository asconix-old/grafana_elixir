defmodule GrafanaElixir.Mixfile do
  use Mix.Project

  def project do
    [app: :grafana_elixir,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :httpoison],
    mod: {GrafanaElixir, []}]
  end

  defp deps do
    [{:httpoison, "~> 0.9.0"}]
  end
end
