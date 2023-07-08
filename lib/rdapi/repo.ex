defmodule Rdapi.Repo do
  use Ecto.Repo,
    otp_app: :rdapi,
    adapter: Ecto.Adapters.Postgres
end
