defmodule Indeals.Mixfile do
  use Mix.Project

  def project do
    [
      app: :indeals,
      version: "0.5.0",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Indeals.Application, []},
      extra_applications: [
        :logger,
        :runtime_tools,
        :bamboo,
        :bamboo_smtp,
        :scrivener,
        :scrivener_ecto,
        :scrivener_html,
        :timex
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.0"},    #was 1.3.0
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      {:guardian, "~> 0.14"},    #was 0.14
      {:guardian_db, "~> 0.8.0"}, #was 0.8.0
      {:comeonin, "~> 4.0"},
      {:bcrypt_elixir, "~> 1.0"},
      {:bamboo_smtp, "~> 1.4.0"},
      {:scrivener, "~> 2.0"},
      {:scrivener_ecto, "~> 1.0"},
      {:scrivener_html, "~> 1.7"},
      {:timex, "~> 3.1"},
      {:sched_ex, "~> 1.1.1"},
      {:html_sanitize_ex, "~> 1.3.0-rc3"},
      {:edeliver, "~> 1.7.0"},
      {:distillery, "~> 2.1.1", warn_missing: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
