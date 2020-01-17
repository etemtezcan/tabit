defmodule IndealsWeb.EkipmanController do
  use IndealsWeb, :controller

  alias Indeals.Tarim
  alias Indeals.Tarim.Ekipman

  def index(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    ekipmanlar = Tarim.list_ekipmanlar_by_user(user.id)
    render(conn, "index.html", ekipmanlar: ekipmanlar)
  end

  def new(conn, _params) do
    changeset = Tarim.change_ekipman(%Ekipman{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"ekipman" => ekipman_params}) do
    user = Guardian.Plug.current_resource(conn)
    case Tarim.create_ekipman(ekipman_params, user) do
      {:ok, ekipman} ->
        conn
        |> put_flash(:info, "Ekipman başarıyla oluşturuldu.")
        |> redirect(to: ekipman_path(conn, :show, ekipman))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    ekipman = Tarim.get_ekipman!(id)
    render(conn, "show.html", ekipman: ekipman)
  end

  def edit(conn, %{"id" => id}) do
    ekipman = Tarim.get_ekipman!(id)
    changeset = Tarim.change_ekipman(ekipman)
    render(conn, "edit.html", ekipman: ekipman, changeset: changeset)
  end

  def update(conn, %{"id" => id, "ekipman" => ekipman_params}) do
    ekipman = Tarim.get_ekipman!(id)

    case Tarim.update_ekipman(ekipman, ekipman_params) do
      {:ok, ekipman} ->
        conn
        |> put_flash(:info, "Ekipman başarıyla güncellendi.")
        |> redirect(to: ekipman_path(conn, :show, ekipman))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", ekipman: ekipman, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    ekipman = Tarim.get_ekipman!(id)
    {:ok, _ekipman} = Tarim.delete_ekipman(ekipman)

    conn
    |> put_flash(:info, "Ekipman başarıyla silindi.")
    |> redirect(to: ekipman_path(conn, :index))
  end

  def all(conn, params \\ %{}) do
      ekipmanlar = Tarim.list_ekipmanlar(params)
      render(conn, "all.html", ekipmanlar: ekipmanlar)
  end

end
