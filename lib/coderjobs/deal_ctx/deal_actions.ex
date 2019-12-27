defmodule Coderjobs.DealCtx.DealActions do
  alias Coderjobs.DealCtx.Deal
  alias Coderjobs.Repo
  use Timex
  import Ecto.Query

  @doc false
  def list(params \\ %{}) do
    Deal
#    |> where([status: ^"active"])
    |> scope_by_search(params)
 #   |> scope_by_location(params)
    |> scope_by_latest
    |> preload([:user])
    |> Repo.paginate(params)
  end

  @doc false
  def list_by_user(user, params \\ %{}) do
    Deal
    |> scope_by_user(user)
 #   |> scope_by_status(params)
    |> scope_by_latest
    |> Repo.paginate(params)
  end

  @doc false
  def find_by_id!(id, user) do
    case user do 
      nil -> Repo.get_by!(Deal, id: id) |> Repo.preload([:user])
      _ -> Repo.get!(Deal, id) |> Repo.preload([:user])
    end
  end

  @doc false
  def find_by_id!(id) do
    Repo.get!(Deal, id) |> Repo.preload([:user])
  end

  @doc false
  def find_by_id(id, user) do
    case user do 
      nil -> Repo.get_by(Deal, id: id) |> Repo.preload([:user])
      _ -> Repo.get(Deal, id) |> Repo.preload([:user])
    end
  end

  @doc false
  def find_by_id(id) do
    Repo.get(Deal, id) |> Repo.preload([:user])
  end

  @doc false
  def find_by_user(id, user) do
    if user.is_admin do
      Repo.get_by(Deal, id: id)
    else
      Repo.get_by(Deal, id: id, user_id: user.id)
    end
  end

  @doc false
  def find_by_user!(id, user) do
    if user.is_admin do
      Repo.get_by!(Deal, id: id)
    else
      Repo.get_by!(Deal, id: id, user_id: user.id)
    end
  end

  def scope_by_user(query, user) do
    if user.is_admin do
      query
    else
      where(query, user_id: ^user.id)
    end
  end

  def scope_by_search(query, params \\ %{}) do
    keyword = Map.get(params, "q", "")
    case keyword do
      "" -> query
      keyword ->
        query |> where([j], ilike(j.title, ^"%#{keyword}%"))
    end
  end

  def search(query, search_term) do
    wildcard_search = "%#{search_term}%"

    from deal in query,
    where: ilike(deal.title, ^wildcard_search)
  end

  def scope_by_location(query, params \\ %{}) do
    location = Map.get(params, "location", "")
    case location do
      "" -> query
      location ->
        query |> where([j], ilike(j.location, ^"%#{location}%"))
    end
  end

  @doc false
  def scope_by_status(query, params \\ %{}) do
    where(query,  [status: ^Map.get(params, "status", "active")])
  end

  @doc false
  def scope_by_latest(query) do
    order_by(query, desc: :updated_at)
  end

  @doc false
  def create(deal_params \\ %{}, user_id) do
    %Deal{}
    |> Deal.submit_changeset(deal_params, user_id)
    |> Repo.insert
  end

  @doc false
  def update(%Deal{} = deal, deal_params \\ %{}) do
    deal
    |> Deal.update_changeset(deal_params)
    |> Repo.update
  end

  @doc false
  def repost(%Deal{} = deal) do
    deal
    |> Deal.repost_changeset
    |> Repo.update
  end

  @doc false
  def destroy(id, user) do
    deal = find_by_user(id, user)
    case deal do
      nil -> {:error, "Unable to find resource"}
      deal -> deal |> Repo.delete
    end
  end
  
  def deal_owner(user_id) do
    if not is_nil(user_id) do
      query = from u in Coderjobs.Account.User, where: u.id == ^user_id, select: u.username
      Repo.all(query)
    else
       "----"
    end  
  end


end