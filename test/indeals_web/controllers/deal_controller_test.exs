defmodule IndealsWeb.DealControllerTest do
  use IndealsWeb.ConnCase

  alias Indeals.DealCtx

  @create_attrs %{description: "some description", price: 120.5, status: "some status", title: "some title", url: "some url", valid: ~D[2010-04-17]}
  @update_attrs %{description: "some updated description", price: 456.7, status: "some updated status", title: "some updated title", url: "some updated url", valid: ~D[2011-05-18]}
  @invalid_attrs %{description: nil, price: nil, status: nil, title: nil, url: nil, valid: nil}

  def fixture(:deal) do
    {:ok, deal} = DealCtx.create_deal(@create_attrs)
    deal
  end

  describe "index" do
    test "lists all deals", %{conn: conn} do
      conn = get conn, deal_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Deals"
    end
  end

  describe "new deal" do
    test "renders form", %{conn: conn} do
      conn = get conn, deal_path(conn, :new)
      assert html_response(conn, 200) =~ "New Deal"
    end
  end

  describe "create deal" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, deal_path(conn, :create), deal: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == deal_path(conn, :show, id)

      conn = get conn, deal_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Deal"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, deal_path(conn, :create), deal: @invalid_attrs
      assert html_response(conn, 200) =~ "New Deal"
    end
  end

  describe "edit deal" do
    setup [:create_deal]

    test "renders form for editing chosen deal", %{conn: conn, deal: deal} do
      conn = get conn, deal_path(conn, :edit, deal)
      assert html_response(conn, 200) =~ "Edit Deal"
    end
  end

  describe "update deal" do
    setup [:create_deal]

    test "redirects when data is valid", %{conn: conn, deal: deal} do
      conn = put conn, deal_path(conn, :update, deal), deal: @update_attrs
      assert redirected_to(conn) == deal_path(conn, :show, deal)

      conn = get conn, deal_path(conn, :show, deal)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, deal: deal} do
      conn = put conn, deal_path(conn, :update, deal), deal: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Deal"
    end
  end

  describe "delete deal" do
    setup [:create_deal]

    test "deletes chosen deal", %{conn: conn, deal: deal} do
      conn = delete conn, deal_path(conn, :delete, deal)
      assert redirected_to(conn) == deal_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, deal_path(conn, :show, deal)
      end
    end
  end

  defp create_deal(_) do
    deal = fixture(:deal)
    {:ok, deal: deal}
  end
end
