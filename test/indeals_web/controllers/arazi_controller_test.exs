defmodule IndealsWeb.AraziControllerTest do
  use IndealsWeb.ConnCase

  alias Indeals.Tarim

  @create_attrs %{ada_pafta: "some ada_pafta", fiyat: 42, gecerlilik: ~D[2010-04-17], il: "some il", ilce: "some ilce", kiralik: true, mahalle: "some mahalle", satılık: true, yuzolcum_m2: 42}
  @update_attrs %{ada_pafta: "some updated ada_pafta", fiyat: 43, gecerlilik: ~D[2011-05-18], il: "some updated il", ilce: "some updated ilce", kiralik: false, mahalle: "some updated mahalle", satılık: false, yuzolcum_m2: 43}
  @invalid_attrs %{ada_pafta: nil, fiyat: nil, gecerlilik: nil, il: nil, ilce: nil, kiralik: nil, mahalle: nil, satılık: nil, yuzolcum_m2: nil}

  def fixture(:arazi) do
    {:ok, arazi} = Tarim.create_arazi(@create_attrs)
    arazi
  end

  describe "index" do
    test "lists all araziler", %{conn: conn} do
      conn = get conn, arazi_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Araziler"
    end
  end

  describe "new arazi" do
    test "renders form", %{conn: conn} do
      conn = get conn, arazi_path(conn, :new)
      assert html_response(conn, 200) =~ "New Arazi"
    end
  end

  describe "create arazi" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, arazi_path(conn, :create), arazi: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == arazi_path(conn, :show, id)

      conn = get conn, arazi_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Arazi"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, arazi_path(conn, :create), arazi: @invalid_attrs
      assert html_response(conn, 200) =~ "New Arazi"
    end
  end

  describe "edit arazi" do
    setup [:create_arazi]

    test "renders form for editing chosen arazi", %{conn: conn, arazi: arazi} do
      conn = get conn, arazi_path(conn, :edit, arazi)
      assert html_response(conn, 200) =~ "Edit Arazi"
    end
  end

  describe "update arazi" do
    setup [:create_arazi]

    test "redirects when data is valid", %{conn: conn, arazi: arazi} do
      conn = put conn, arazi_path(conn, :update, arazi), arazi: @update_attrs
      assert redirected_to(conn) == arazi_path(conn, :show, arazi)

      conn = get conn, arazi_path(conn, :show, arazi)
      assert html_response(conn, 200) =~ "some updated ada_pafta"
    end

    test "renders errors when data is invalid", %{conn: conn, arazi: arazi} do
      conn = put conn, arazi_path(conn, :update, arazi), arazi: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Arazi"
    end
  end

  describe "delete arazi" do
    setup [:create_arazi]

    test "deletes chosen arazi", %{conn: conn, arazi: arazi} do
      conn = delete conn, arazi_path(conn, :delete, arazi)
      assert redirected_to(conn) == arazi_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, arazi_path(conn, :show, arazi)
      end
    end
  end

  defp create_arazi(_) do
    arazi = fixture(:arazi)
    {:ok, arazi: arazi}
  end
end
