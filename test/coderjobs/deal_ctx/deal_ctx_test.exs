defmodule Coderjobs.DealCtxTest do
  use Coderjobs.DataCase

  alias Coderjobs.DealCtx

  describe "deals" do
    alias Coderjobs.DealCtx.Deal

    @valid_attrs %{description: "some description", price: 120.5, status: "some status", title: "some title", url: "some url", valid: ~D[2010-04-17]}
    @update_attrs %{description: "some updated description", price: 456.7, status: "some updated status", title: "some updated title", url: "some updated url", valid: ~D[2011-05-18]}
    @invalid_attrs %{description: nil, price: nil, status: nil, title: nil, url: nil, valid: nil}

    def deal_fixture(attrs \\ %{}) do
      {:ok, deal} =
        attrs
        |> Enum.into(@valid_attrs)
        |> DealCtx.create_deal()

      deal
    end

    test "list_deals/0 returns all deals" do
      deal = deal_fixture()
      assert DealCtx.list_deals() == [deal]
    end

    test "get_deal!/1 returns the deal with given id" do
      deal = deal_fixture()
      assert DealCtx.get_deal!(deal.id) == deal
    end

    test "create_deal/1 with valid data creates a deal" do
      assert {:ok, %Deal{} = deal} = DealCtx.create_deal(@valid_attrs)
      assert deal.description == "some description"
      assert deal.price == 120.5
      assert deal.status == "some status"
      assert deal.title == "some title"
      assert deal.url == "some url"
      assert deal.valid == ~D[2010-04-17]
    end

    test "create_deal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DealCtx.create_deal(@invalid_attrs)
    end

    test "update_deal/2 with valid data updates the deal" do
      deal = deal_fixture()
      assert {:ok, deal} = DealCtx.update_deal(deal, @update_attrs)
      assert %Deal{} = deal
      assert deal.description == "some updated description"
      assert deal.price == 456.7
      assert deal.status == "some updated status"
      assert deal.title == "some updated title"
      assert deal.url == "some updated url"
      assert deal.valid == ~D[2011-05-18]
    end

    test "update_deal/2 with invalid data returns error changeset" do
      deal = deal_fixture()
      assert {:error, %Ecto.Changeset{}} = DealCtx.update_deal(deal, @invalid_attrs)
      assert deal == DealCtx.get_deal!(deal.id)
    end

    test "delete_deal/1 deletes the deal" do
      deal = deal_fixture()
      assert {:ok, %Deal{}} = DealCtx.delete_deal(deal)
      assert_raise Ecto.NoResultsError, fn -> DealCtx.get_deal!(deal.id) end
    end

    test "change_deal/1 returns a deal changeset" do
      deal = deal_fixture()
      assert %Ecto.Changeset{} = DealCtx.change_deal(deal)
    end
  end
end
