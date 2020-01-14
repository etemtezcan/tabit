defmodule IndealsWeb.GubreController do
  use IndealsWeb, :controller

  alias Indeals.Tarim
  alias Indeals.Tarim.Gubre

  def index(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    gubreler = Tarim.list_gubreler_by_user(user.id)
    render(conn, "index.html", gubreler: gubreler)
  end

  def new(conn, _params) do
    changeset = Tarim.change_gubre(%Gubre{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"gubre" => gubre_params}) do
    user = Guardian.Plug.current_resource(conn)
    case Tarim.create_gubre(gubre_params, user) do
      {:ok, gubre} ->
        conn
        |> put_flash(:info, "Gübre başarıyla oluşturuldu.")
        |> redirect(to: gubre_path(conn, :show, gubre))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    gubre = Tarim.get_gubre!(id)
    render(conn, "show.html", gubre: gubre)
  end

  def edit(conn, %{"id" => id}) do
    gubre = Tarim.get_gubre!(id)
    changeset = Tarim.change_gubre(gubre)
    render(conn, "edit.html", gubre: gubre, changeset: changeset)
  end

  def update(conn, %{"id" => id, "gubre" => gubre_params}) do
    gubre = Tarim.get_gubre!(id)

    case Tarim.update_gubre(gubre, gubre_params) do
      {:ok, gubre} ->
        conn
        |> put_flash(:info, "Gübre başarıyla güncellendi.")
        |> redirect(to: gubre_path(conn, :show, gubre))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", gubre: gubre, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    gubre = Tarim.get_gubre!(id)
    {:ok, _gubre} = Tarim.delete_gubre(gubre)

    conn
    |> put_flash(:info, "Gübre başarıyla silindi.")
    |> redirect(to: gubre_path(conn, :index))
  end

  def all(conn, params \\ %{}) do
      gubreler = Tarim.list_gubreler(params)
      render(conn, "all.html", gubreler: gubreler)
  end

end
