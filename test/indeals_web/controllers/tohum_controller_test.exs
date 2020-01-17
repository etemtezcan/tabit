defmodule IndealsWeb.TohumControllerTest do
  use IndealsWeb.ConnCase

  alias Indeals.Tarim

  @create_attrs %{açıklama: "some açıklama", cins: "some cins", gecerlilik: ~D[2010-04-17], kilo_fiyat: "120.5", yer: "some yer", çeşit: "some çeşit"}
  @update_attrs %{açıklama: "some updated açıklama", cins: "some updated cins", gecerlilik: ~D[2011-05-18], kilo_fiyat: "456.7", yer: "some updated yer", çeşit: "some updated çeşit"}
  @invalid_attrs %{açıklama: nil, cins: nil, gecerlilik: nil, kilo_fiyat: nil, yer: nil, çeşit: nil}

  def fixture(:tohum) do
    {:ok, tohum} = Tarim.create_tohum(@create_attrs)
    tohum
  end

  describe "index" do
    test "lists all tohumlar", %{conn: conn} do
      conn = get conn, tohum_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Tohumlar"
    end
  end

  describe "new tohum" do
    test "renders form", %{conn: conn} do
      conn = get conn, tohum_path(conn, :new)
      assert html_response(conn, 200) =~ "New Tohum"
    end
  end

  describe "create tohum" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, tohum_path(conn, :create), tohum: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == tohum_path(conn, :show, id)

      conn = get conn, tohum_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Tohum"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, tohum_path(conn, :create), tohum: @invalid_attrs
      assert html_response(conn, 200) =~ "New Tohum"
    end
  end

  describe "edit tohum" do
    setup [:create_tohum]

    test "renders form for editing chosen tohum", %{conn: conn, tohum: tohum} do
      conn = get conn, tohum_path(conn, :edit, tohum)
      assert html_response(conn, 200) =~ "Edit Tohum"
    end
  end

  describe "update tohum" do
    setup [:create_tohum]

    test "redirects when data is valid", %{conn: conn, tohum: tohum} do
      conn = put conn, tohum_path(conn, :update, tohum), tohum: @update_attrs
      assert redirected_to(conn) == tohum_path(conn, :show, tohum)

      conn = get conn, tohum_path(conn, :show, tohum)
      assert html_response(conn, 200) =~ "some updated açıklama"
    end

    test "renders errors when data is invalid", %{conn: conn, tohum: tohum} do
      conn = put conn, tohum_path(conn, :update, tohum), tohum: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Tohum"
    end
  end

  describe "delete tohum" do
    setup [:create_tohum]

    test "deletes chosen tohum", %{conn: conn, tohum: tohum} do
      conn = delete conn, tohum_path(conn, :delete, tohum)
      assert redirected_to(conn) == tohum_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, tohum_path(conn, :show, tohum)
      end
    end
  end

  defp create_tohum(_) do
    tohum = fixture(:tohum)
    {:ok, tohum: tohum}
  end
end
