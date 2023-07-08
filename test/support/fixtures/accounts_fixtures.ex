defmodule Rdapi.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rdapi.Accounts` context.
  """

  @doc """
  Generate a account.
  """
  def account_fixture(attrs \\ %{}) do
    {:ok, account} =
      attrs
      |> Enum.into(%{
        hash: "some hash",
        email: "some email"
      })
      |> Rdapi.Accounts.create_account()

    account
  end
end
