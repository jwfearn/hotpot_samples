defmodule MyLeader.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hotpot_sample,
      build_embedded: Mix.env == :prod,
      deps: deps(),
      elixir: "~> 1.4",
      start_permanent: Mix.env == :prod,
      version: "0.1.0"
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      applications: [:hotpot]
    ]
  end

  defp deps do
    [
      {:hotpot, github: "jwfearn/hotpot"}
    ]
  end
end
