defmodule RdapiWeb.Auth.Guardian do
  use Guardian, otp_app: :rdapi

  alias Rdapi.Accounts

  def subject_for_token(%{id: id}, _claims) do
    sub = to_string(id)
    {:ok, sub}
  end

  def subject_for_token(_, _) do
    {:error, :no_id_provided}
  end

  def resource_from_claims(%{"sub" => sub}) do
    case Accounts.get_account!(sub) do
      nil -> {:error, :not_found}
      resource -> {:ok, resource}
    end
  end

  def resource_from_claims(_) do
    {:error, :no_id_provided}
  end

  def authenticate(email, password) do
    case Accounts.get_account_by_email(email) do
      nil ->
        {:error, :not_authorized}

      account ->
        case verify_password(password, account.hash) do
          true -> create_token(account)
          false -> {:error, :not_authorized}
        end
    end
  end

  defp verify_password(password, hash) do
    Bcrypt.verify_pass(password, hash)
  end

  defp create_token(account) do
    {:ok, token, _claims} = encode_and_sign(account)
    {:ok, account, token}
  end
end
