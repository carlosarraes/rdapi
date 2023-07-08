defmodule RdapiWeb.DefaultController do
  use RdapiWeb, :controller

  def index(conn, _params) do
    json(conn, %{message: "Using: #{Mix.env()}"})
  end
end
