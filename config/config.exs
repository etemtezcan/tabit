# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :indeals,
  ecto_repos: [Indeals.Repo]

  
  config :indeals, IndealsWeb.Gettext, locales: ~w(en tr) , default_locale: "tr"
# Configures the endpoint
config :indeals, IndealsWeb.Endpoint,
  url: [host: System.get_env("APP_HOST")],
  secret_key_base: "rRkU1m/3/O87Oz8udR6E1CoUljpvyFsCPLJFCGUA/4ip7XX9jsY6cz/7N7DV/Ycq",
  render_errors: [view: IndealsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Indeals.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  hooks: GuardianDb,
  issuer: "indeals",
  ttl: { 30, :days },
  allowed_drift: 2000,
  secret_key: "e4AaHjImRyAKjsu/9rl3Li90myTFDxlzublTH9Gzck3y9tZdhRFnaUkS/U3Jd/rO",
  serializer: Indeals.GuardianSerializer

config :guardian_db, GuardianDb,
  repo: Indeals.Repo,
  schema_name: "guardian_tokens"

# In your config/config.exs file
config :indeals, Indeals.Mailer,
  adapter: Bamboo.MailgunAdapter,
  api_key: "",
  domain: ""

  # adapter: Bamboo.SMTPAdapter,
 #  server: System.get_env("SMTP_HOST"),
  # hostname: System.get_env("APP_HOST"),
   #port: System.get_env("SMTP_PORT"),
 #  username: System.get_env("SMTP_USER"),
 #  password: System.get_env("SMTP_PASS"),
 #  tls: :if_available, # can be `:always` or `:never`
 #  allowed_tls_versions: [:"tlsv1", :"tlsv1.1", :"tlsv1.2"],
 #  ssl: false,
 #  retries: 1

import_config "vars.exs"
import_config "#{Mix.env}.exs"
