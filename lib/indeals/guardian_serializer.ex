defmodule Indeals.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias Indeals.Repo
  alias Indeals.Account.User

  def for_token(user = %User{}), do: { :ok, "user:#{user.id}" }

  def for_token(_), do: { :error, "Unknown resource type" }

  def from_token("user:" <> id), do: { :ok, Repo.get(User, id) }
  
  def from_token(_), do: { :error, "Unknown resource type" }
end