defmodule RdapiWeb.Router do
  use RdapiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RdapiWeb do
    pipe_through :api
    get "/", DefaultController, :index
  end

  scope "/account", RdapiWeb do
    pipe_through :api
    get "/", AccountController, :index
    post "/", AccountController, :create
    get "/:id", AccountController, :show
    put "/:id", AccountController, :update
    delete "/:id", AccountController, :delete
  end
end
