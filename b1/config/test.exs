import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :b1, B1Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Df7otzGuO/ZRssAWs6IYleJToFerz1Ys90iHwKk1mNpk0HNrp4Ycy8Oa35D72T3o",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
