defmodule RdapiWeb.Router do
  use RdapiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RdapiWeb do
    pipe_through :api
  end
end
