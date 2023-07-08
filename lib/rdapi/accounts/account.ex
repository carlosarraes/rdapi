defmodule Rdapi.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "accounts" do
    field :hash, :string
    field :email, :string
    has_one :user, Rdapi.Users.User

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:email, :hash])
    |> validate_required([:email, :hash])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "is invalid")
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{hash: hash}} = changeset) do
    change(changeset, hash: Bcrypt.hash_pwd_salt(hash))
  end

  defp put_password_hash(changeset), do: changeset
end
