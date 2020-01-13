defmodule IndealsWeb.GubreControllerTest do
  use IndealsWeb.ConnCase

  alias Indeals.Tarim

  @create_attrs %{ad: "some ad", gecerlilik: ~D[2010-04-17], kilo: 42, kilo_fiyat: "120.5", makro: true, mikro: true, yer: "some yer"}
  @update_attrs %{ad: "some updated ad", gecerlilik: ~D[2011-05-18], kilo: 43, kilo_fiyat: "456.7", makro: false, mikro: false, yer: "some updated yer"}
  @invalid_attrs %{ad: nil, gecerlilik: nil, kilo: nil, kilo_fiyat: nil, makro: nil, mikro: nil, yer: nil}

  def fixture(:gubre) do
    {:ok, gubre} = Tarim.create_gubre(@create_attrs)
    gubre
  end

  describe "index" do
    test "lists all gubreler", %{conn: conn} do
      conn = get conn, gubre_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Gubreler"
    end
  end

  describe "new gubre" do
    test "renders form", %{conn: conn} do
      conn = get conn, gubre_path(conn, :new)
      assert html_response(conn, 200) =~ "New Gubre"
    end
  end

  describe "create gubre" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, gubre_path(conn, :create), gubre: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == gubre_path(conn, :show, id)

      conn = get conn, gubre_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Gubre"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, gubre_path(conn, :create), gubre: @invalid_attrs
      assert html_response(conn, 200) =~ "New Gubre"
    end
  end

  describe "edit gubre" do
    setup [:create_gubre]

    test "renders form for editing chosen gubre", %{conn: conn, gubre: gubre} do
      conn = get conn, gubre_path(conn, :edit, gubre)
      assert html_response(conn, 200) =~ "Edit Gubre"
    end
  end

  describe "update gubre" do
    setup [:create_gubre]

    test "redirects when data is valid", %{conn: conn, gubre: gubre} do
      conn = put conn, gubre_path(conn, :update, gubre), gubre: @update_attrs
      assert redirected_to(conn) == gubre_path(conn, :show, gubre)

      conn = get conn, gubre_path(conn, :show, gubre)
      assert html_response(conn, 200) =~ "some updated ad"
    end

    test "renders errors when data is invalid", %{conn: conn, gubre: gubre} do
      conn = put conn, gubre_path(conn, :update, gubre), gubre: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Gubre"
    end
  end

  describe "delete gubre" do
    setup [:create_gubre]

    test "deletes chosen gubre", %{conn: conn, gubre: gubre} do
      conn = delete conn, gubre_path(conn, :delete, gubre)
      assert redirected_to(conn) == gubre_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, gubre_path(conn, :show, gubre)
      end
    end
  end

  defp create_gubre(_) do
    gubre = fixture(:gubre)
    {:ok, gubre: gubre}
  end
end
