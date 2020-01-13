defmodule IndealsWeb.UrunControllerTest do
  use IndealsWeb.ConnCase

  alias Indeals.Tarim

  @create_attrs %{açıklama: "some açıklama", cins: "some cins", gecerlilik: ~D[2010-04-17], kilo_fiyat: "120.5", miktar_ton: 42, uretim_tarihi: ~D[2010-04-17], yer: "some yer"}
  @update_attrs %{açıklama: "some updated açıklama", cins: "some updated cins", gecerlilik: ~D[2011-05-18], kilo_fiyat: "456.7", miktar_ton: 43, uretim_tarihi: ~D[2011-05-18], yer: "some updated yer"}
  @invalid_attrs %{açıklama: nil, cins: nil, gecerlilik: nil, kilo_fiyat: nil, miktar_ton: nil, uretim_tarihi: nil, yer: nil}

  def fixture(:urun) do
    {:ok, urun} = Tarim.create_urun(@create_attrs)
    urun
  end

  describe "index" do
    test "lists all urunler", %{conn: conn} do
      conn = get conn, urun_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Urunler"
    end
  end

  describe "new urun" do
    test "renders form", %{conn: conn} do
      conn = get conn, urun_path(conn, :new)
      assert html_response(conn, 200) =~ "New Urun"
    end
  end

  describe "create urun" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, urun_path(conn, :create), urun: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == urun_path(conn, :show, id)

      conn = get conn, urun_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Urun"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, urun_path(conn, :create), urun: @invalid_attrs
      assert html_response(conn, 200) =~ "New Urun"
    end
  end

  describe "edit urun" do
    setup [:create_urun]

    test "renders form for editing chosen urun", %{conn: conn, urun: urun} do
      conn = get conn, urun_path(conn, :edit, urun)
      assert html_response(conn, 200) =~ "Edit Urun"
    end
  end

  describe "update urun" do
    setup [:create_urun]

    test "redirects when data is valid", %{conn: conn, urun: urun} do
      conn = put conn, urun_path(conn, :update, urun), urun: @update_attrs
      assert redirected_to(conn) == urun_path(conn, :show, urun)

      conn = get conn, urun_path(conn, :show, urun)
      assert html_response(conn, 200) =~ "some updated açıklama"
    end

    test "renders errors when data is invalid", %{conn: conn, urun: urun} do
      conn = put conn, urun_path(conn, :update, urun), urun: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Urun"
    end
  end

  describe "delete urun" do
    setup [:create_urun]

    test "deletes chosen urun", %{conn: conn, urun: urun} do
      conn = delete conn, urun_path(conn, :delete, urun)
      assert redirected_to(conn) == urun_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, urun_path(conn, :show, urun)
      end
    end
  end

  defp create_urun(_) do
    urun = fixture(:urun)
    {:ok, urun: urun}
  end
end
