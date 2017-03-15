use Mix.Config

config :cast_assoc_returns_stale_data, ecto_repos: [ CastAssocReturnsStaleData.Repo ]

config :cast_assoc_returns_stale_data, CastAssocReturnsStaleData.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "cast_assoc_returns_stale_data_test",
  hostname: "pg_local",
  pool: Ecto.Adapters.SQL.Sandbox

config :logger, level: :debug

