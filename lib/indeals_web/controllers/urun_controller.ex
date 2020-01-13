defmodule IndealsWeb.UrunController do
  use IndealsWeb, :controller

  alias Indeals.Tarim
  alias Indeals.Tarim.Urun

  def index(conn, _params) do
    urunler = Tarim.list_urunler()
    render(conn, "index.html", urunler: urunler)
  end

  def new(conn, _params) do
    changeset = Tarim.change_urun(%Urun{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"urun" => urun_params}) do
    case Tarim.create_urun(urun_params) do
      {:ok, urun} ->
        conn
        |> put_flash(:info, "Ürün başarıyla oluşturuldu.")
        |> redirect(to: urun_path(conn, :show, urun))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    urun = Tarim.get_urun!(id)
    render(conn, "show.html", urun: urun)
  end

  def edit(conn, %{"id" => id}) do
    urun = Tarim.get_urun!(id)
    changeset = Tarim.change_urun(urun)
    render(conn, "edit.html", urun: urun, changeset: changeset)
  end

  def update(conn, %{"id" => id, "urun" => urun_params}) do
    urun = Tarim.get_urun!(id)

    case Tarim.update_urun(urun, urun_params) do
      {:ok, urun} ->
        conn
        |> put_flash(:info, "Ürün başarıyla güncellendi.")
        |> redirect(to: urun_path(conn, :show, urun))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", urun: urun, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    urun = Tarim.get_urun!(id)
    {:ok, _urun} = Tarim.delete_urun(urun)

    conn
    |> put_flash(:info, "Ürün başarıyla silindi.")
    |> redirect(to: urun_path(conn, :index))
  end


  def all(conn, params \\ %{}) do
      urunler = Tarim.list_urunler(params)
      render(conn, "all.html", urunler: urunler)
  end


end
