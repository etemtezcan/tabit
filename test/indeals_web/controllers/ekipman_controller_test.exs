defmodule IndealsWeb.EkipmanControllerTest do
  use IndealsWeb.ConnCase

  alias Indeals.Tarim

  @create_attrs %{cins: "some cins", fiyat: 42, gecerlilik: ~D[2010-04-17], marka: "some marka", model: "some model", yer: "some yer", özellik: "some özellik"}
  @update_attrs %{cins: "some updated cins", fiyat: 43, gecerlilik: ~D[2011-05-18], marka: "some updated marka", model: "some updated model", yer: "some updated yer", özellik: "some updated özellik"}
  @invalid_attrs %{cins: nil, fiyat: nil, gecerlilik: nil, marka: nil, model: nil, yer: nil, özellik: nil}

  def fixture(:ekipman) do
    {:ok, ekipman} = Tarim.create_ekipman(@create_attrs)
    ekipman
  end

  describe "index" do
    test "lists all ekipmanlar", %{conn: conn} do
      conn = get conn, ekipman_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Ekipmanlar"
    end
  end

  describe "new ekipman" do
    test "renders form", %{conn: conn} do
      conn = get conn, ekipman_path(conn, :new)
      assert html_response(conn, 200) =~ "New Ekipman"
    end
  end

  describe "create ekipman" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, ekipman_path(conn, :create), ekipman: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ekipman_path(conn, :show, id)

      conn = get conn, ekipman_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Ekipman"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, ekipman_path(conn, :create), ekipman: @invalid_attrs
      assert html_response(conn, 200) =~ "New Ekipman"
    end
  end

  describe "edit ekipman" do
    setup [:create_ekipman]

    test "renders form for editing chosen ekipman", %{conn: conn, ekipman: ekipman} do
      conn = get conn, ekipman_path(conn, :edit, ekipman)
      assert html_response(conn, 200) =~ "Edit Ekipman"
    end
  end

  describe "update ekipman" do
    setup [:create_ekipman]

    test "redirects when data is valid", %{conn: conn, ekipman: ekipman} do
      conn = put conn, ekipman_path(conn, :update, ekipman), ekipman: @update_attrs
      assert redirected_to(conn) == ekipman_path(conn, :show, ekipman)

      conn = get conn, ekipman_path(conn, :show, ekipman)
      assert html_response(conn, 200) =~ "some updated cins"
    end

    test "renders errors when data is invalid", %{conn: conn, ekipman: ekipman} do
      conn = put conn, ekipman_path(conn, :update, ekipman), ekipman: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Ekipman"
    end
  end

  describe "delete ekipman" do
    setup [:create_ekipman]

    test "deletes chosen ekipman", %{conn: conn, ekipman: ekipman} do
      conn = delete conn, ekipman_path(conn, :delete, ekipman)
      assert redirected_to(conn) == ekipman_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, ekipman_path(conn, :show, ekipman)
      end
    end
  end

  defp create_ekipman(_) do
    ekipman = fixture(:ekipman)
    {:ok, ekipman: ekipman}
  end
end
