defmodule Indeals.Account.UserAccountActions do

  alias Indeals.Account.User
  alias Indeals.Repo

  def find_by_id!(id) do
    Repo.get!(User, id)
  end

  def update(user, user_params) do
    user
    |> User.account_changeset(user_params)
    |> Repo.update
  end

  def update_password(user, user_params) do
    user
    |> User.password_changeset(user_params)
    |> Repo.update
  end
end
  