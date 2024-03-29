defmodule IndealsWeb.AraziController do
  use IndealsWeb, :controller

  alias Indeals.Tarim
  alias Indeals.Tarim.Arazi


  def index(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    araziler = Tarim.list_araziler_by_user(user.id)
    render(conn, "index.html", araziler: araziler)
  end

  def new(conn, _params) do
    changeset = Tarim.change_arazi(%Arazi{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"arazi" => arazi_params}) do
    user = Guardian.Plug.current_resource(conn)

    case Tarim.create_arazi(arazi_params, user) do
      {:ok, arazi} ->
        conn
        |> put_flash(:info, "Arazi başarıyla oluşturuldu.")
        |> redirect(to: arazi_path(conn, :show, arazi))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    arazi = Tarim.get_arazi!(id)
    render(conn, "show.html", arazi: arazi)
  end

  def edit(conn, %{"id" => id}) do
    arazi = Tarim.get_arazi!(id)
    changeset = Tarim.change_arazi(arazi)
    render(conn, "edit.html", arazi: arazi, changeset: changeset)
  end

  def update(conn, %{"id" => id, "arazi" => arazi_params}) do
    arazi = Tarim.get_arazi!(id)

    case Tarim.update_arazi(arazi, arazi_params) do
      {:ok, arazi} ->
        conn
        |> put_flash(:info, "Arazi başarıyla güncellendi.")
        |> redirect(to: arazi_path(conn, :show, arazi))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", arazi: arazi, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    arazi = Tarim.get_arazi!(id)
    {:ok, _arazi} = Tarim.delete_arazi(arazi)

    conn
    |> put_flash(:info, "Arazi başarıyla silindi.")
    |> redirect(to: arazi_path(conn, :index))
  end
  def all(conn, params \\ %{}) do
      araziler = Tarim.list_araziler(params)
      render(conn, "all.html", araziler: araziler)
  end



end
