defmodule IndealsWeb.TohumController do
  use IndealsWeb, :controller

  alias Indeals.Tarim
  alias Indeals.Tarim.Tohum

  def index(conn, _params) do
    tohumlar = Tarim.list_tohumlar()
    render(conn, "index.html", tohumlar: tohumlar)
  end

  def new(conn, _params) do
    changeset = Tarim.change_tohum(%Tohum{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tohum" => tohum_params}) do
    user = Guardian.Plug.current_resource(conn)
    case Tarim.create_tohum(tohum_params, user) do
      {:ok, tohum} ->
        conn
        |> put_flash(:info, "Tohum başarıyla oluşturuldu.")
        |> redirect(to: tohum_path(conn, :show, tohum))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tohum = Tarim.get_tohum!(id)
    render(conn, "show.html", tohum: tohum)
  end

  def edit(conn, %{"id" => id}) do
    tohum = Tarim.get_tohum!(id)
    changeset = Tarim.change_tohum(tohum)
    render(conn, "edit.html", tohum: tohum, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tohum" => tohum_params}) do
    tohum = Tarim.get_tohum!(id)

    case Tarim.update_tohum(tohum, tohum_params) do
      {:ok, tohum} ->
        conn
        |> put_flash(:info, "Tohum başarıyla güncellendi.")
        |> redirect(to: tohum_path(conn, :show, tohum))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", tohum: tohum, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tohum = Tarim.get_tohum!(id)
    {:ok, _tohum} = Tarim.delete_tohum(tohum)

    conn
    |> put_flash(:info, "Tohum başarıyla silindi.")
    |> redirect(to: tohum_path(conn, :index))
  end

  def all(conn, params \\ %{}) do
      tohumlar = Tarim.list_tohumlar(params)
      render(conn, "all.html", tohumlar: tohumlar)
  end

end
