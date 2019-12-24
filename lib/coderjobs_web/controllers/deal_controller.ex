defmodule CoderjobsWeb.DealController do
  use CoderjobsWeb, :controller

  alias Coderjobs.DealCtx
  alias Coderjobs.DealCtx.Deal
  alias Coderjobs.DealCtx.DealActions

  def show(conn, %{"id" => id}) do
    user = Guardian.Plug.current_resource(conn)
    deal = DealActions.find_by_id!(id, user)
    render(conn, "show.html", deal: deal)
  end

  def index(conn, params \\ %{}) do
    user = Guardian.Plug.current_resource(conn)
    page = DealActions.list_by_user(user, params)
    render(conn, "index.html",
      user: user,
      deals: page.entries,
      page: page,
      total: page.total_entries
     # status: Map.get(params, "status", "active")
    )
  end

  def new(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    render conn, "new.html",
      changeset: Deal.submit_changeset(%Deal{}, %{}, user.id),
      user: user,
#      locations: get_locations(),
#      salary_ranges: Application.get_env(:coderjobs, :salary_ranges),
      status: ""
  end

  defp get_locations() do
    Application.get_env(:coderjobs, :locations)
    |> Enum.map(fn {k, v} -> {v, k} end)
  end

  def create(conn, %{"deal" => deal_params}) do
    user = Guardian.Plug.current_resource(conn)
    case DealActions.create(deal_params, user.id) do
      {:ok, _} ->
        conn
        |> put_flash(:info, gettext "Deal created.")
        |> redirect(to: "/deals")
      {:error, changeset} ->
        render conn, "new.html",
          changeset: changeset,
          user: user,
       #   locations: get_locations(),
        #  salary_ranges: Application.get_env(:coderjobs, :salary_ranges),
          status: ""
    end
  end

  def repost(conn, %{"id" => id}) do
    user = Guardian.Plug.current_resource(conn)
    deal = DealActions.find_by_user!(id, user.id)
    case DealActions.repost(deal) do
      {:ok, _} ->
        conn
        |> put_flash(:info, gettext "Deal reposted.")
        |> redirect(to: "/deals")
      {:error, _} ->
        conn
        |> put_flash(:error, gettext "Invalid operation.")
        |> redirect(to: "/deals")
    end
  end

  def edit(conn, %{"id" => id}) do
    user = Guardian.Plug.current_resource(conn)
    deal = DealActions.find_by_user(id, user)
    case deal do
      nil ->
        conn
        |> put_flash(:error, gettext "Cannot find deal.")
        |> redirect(to: "/deals")
      deal ->
        render conn, "edit.html",
        changeset: Deal.update_changeset(deal, %{}),
        user: user,
        deal: deal,
        locations: get_locations(),
        salary_ranges: Application.get_env(:coderjobs, :salary_ranges),
        status: ""
    end
  end

  def update(conn, %{"deal" => deal_params, "id" => id}) do
    user = Guardian.Plug.current_resource(conn)
    deal = DealActions.find_by_user!(id, user)
    case DealActions.update(deal, deal_params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, gettext "Deal updated.")
        |> redirect(to: "/deals")
      {:error, changeset} ->
        render conn, "new.html",
          changeset: changeset,
          user: user,
          locations: get_locations(),
          salary_ranges: Application.get_env(:coderjobs, :salary_ranges),
          status: ""
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Guardian.Plug.current_resource(conn)
    case DealActions.destroy(id, user) do
      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> redirect(to: "/deals")
      {:ok, _} ->
        conn
        |> put_flash(:info, gettext "Deal was successfully deleted.")
        |> redirect(to: "/deals")
    end
  end

  def all(conn, params \\ %{}) do
      deals = DealCtx.list_deals(params)
      render(conn, "all.html", deals: deals)
    end

  
end
