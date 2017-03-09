defmodule HotpotSample2.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hotpot_sample_2,
      build_embedded: Mix.env == :prod,
      deps: deps(),
      elixir: "~> 1.4",
      start_permanent: Mix.env == :prod,
      version: "0.1.0"
    ]
  end

  def application do
    [
      mod: {HotpotSample2, []},
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
