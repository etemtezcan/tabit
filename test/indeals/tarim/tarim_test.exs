defmodule Indeals.TarimTest do
  use Indeals.DataCase

  alias Indeals.Tarim

  describe "urunler" do
    alias Indeals.Tarim.Urun

    @valid_attrs %{açıklama: "some açıklama", cins: "some cins", gecerlilik: ~D[2010-04-17], kilo_fiyat: "120.5", miktar_ton: 42, uretim_tarihi: ~D[2010-04-17], yer: "some yer"}
    @update_attrs %{açıklama: "some updated açıklama", cins: "some updated cins", gecerlilik: ~D[2011-05-18], kilo_fiyat: "456.7", miktar_ton: 43, uretim_tarihi: ~D[2011-05-18], yer: "some updated yer"}
    @invalid_attrs %{açıklama: nil, cins: nil, gecerlilik: nil, kilo_fiyat: nil, miktar_ton: nil, uretim_tarihi: nil, yer: nil}

    def urun_fixture(attrs \\ %{}) do
      {:ok, urun} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tarim.create_urun()

      urun
    end

    test "list_urunler/0 returns all urunler" do
      urun = urun_fixture()
      assert Tarim.list_urunler() == [urun]
    end

    test "get_urun!/1 returns the urun with given id" do
      urun = urun_fixture()
      assert Tarim.get_urun!(urun.id) == urun
    end

    test "create_urun/1 with valid data creates a urun" do
      assert {:ok, %Urun{} = urun} = Tarim.create_urun(@valid_attrs)
      assert urun.açıklama == "some açıklama"
      assert urun.cins == "some cins"
      assert urun.gecerlilik == ~D[2010-04-17]
      assert urun.kilo_fiyat == Decimal.new("120.5")
      assert urun.miktar_ton == 42
      assert urun.uretim_tarihi == ~D[2010-04-17]
      assert urun.yer == "some yer"
    end

    test "create_urun/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tarim.create_urun(@invalid_attrs)
    end

    test "update_urun/2 with valid data updates the urun" do
      urun = urun_fixture()
      assert {:ok, urun} = Tarim.update_urun(urun, @update_attrs)
      assert %Urun{} = urun
      assert urun.açıklama == "some updated açıklama"
      assert urun.cins == "some updated cins"
      assert urun.gecerlilik == ~D[2011-05-18]
      assert urun.kilo_fiyat == Decimal.new("456.7")
      assert urun.miktar_ton == 43
      assert urun.uretim_tarihi == ~D[2011-05-18]
      assert urun.yer == "some updated yer"
    end

    test "update_urun/2 with invalid data returns error changeset" do
      urun = urun_fixture()
      assert {:error, %Ecto.Changeset{}} = Tarim.update_urun(urun, @invalid_attrs)
      assert urun == Tarim.get_urun!(urun.id)
    end

    test "delete_urun/1 deletes the urun" do
      urun = urun_fixture()
      assert {:ok, %Urun{}} = Tarim.delete_urun(urun)
      assert_raise Ecto.NoResultsError, fn -> Tarim.get_urun!(urun.id) end
    end

    test "change_urun/1 returns a urun changeset" do
      urun = urun_fixture()
      assert %Ecto.Changeset{} = Tarim.change_urun(urun)
    end
  end

  describe "tohumlar" do
    alias Indeals.Tarim.Tohum

    @valid_attrs %{açıklama: "some açıklama", cins: "some cins", gecerlilik: ~D[2010-04-17], kilo_fiyat: "120.5", yer: "some yer", çeşit: "some çeşit"}
    @update_attrs %{açıklama: "some updated açıklama", cins: "some updated cins", gecerlilik: ~D[2011-05-18], kilo_fiyat: "456.7", yer: "some updated yer", çeşit: "some updated çeşit"}
    @invalid_attrs %{açıklama: nil, cins: nil, gecerlilik: nil, kilo_fiyat: nil, yer: nil, çeşit: nil}

    def tohum_fixture(attrs \\ %{}) do
      {:ok, tohum} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tarim.create_tohum()

      tohum
    end

    test "list_tohumlar/0 returns all tohumlar" do
      tohum = tohum_fixture()
      assert Tarim.list_tohumlar() == [tohum]
    end

    test "get_tohum!/1 returns the tohum with given id" do
      tohum = tohum_fixture()
      assert Tarim.get_tohum!(tohum.id) == tohum
    end

    test "create_tohum/1 with valid data creates a tohum" do
      assert {:ok, %Tohum{} = tohum} = Tarim.create_tohum(@valid_attrs)
      assert tohum.açıklama == "some açıklama"
      assert tohum.cins == "some cins"
      assert tohum.gecerlilik == ~D[2010-04-17]
      assert tohum.kilo_fiyat == Decimal.new("120.5")
      assert tohum.yer == "some yer"
      assert tohum.çeşit == "some çeşit"
    end

    test "create_tohum/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tarim.create_tohum(@invalid_attrs)
    end

    test "update_tohum/2 with valid data updates the tohum" do
      tohum = tohum_fixture()
      assert {:ok, tohum} = Tarim.update_tohum(tohum, @update_attrs)
      assert %Tohum{} = tohum
      assert tohum.açıklama == "some updated açıklama"
      assert tohum.cins == "some updated cins"
      assert tohum.gecerlilik == ~D[2011-05-18]
      assert tohum.kilo_fiyat == Decimal.new("456.7")
      assert tohum.yer == "some updated yer"
      assert tohum.çeşit == "some updated çeşit"
    end

    test "update_tohum/2 with invalid data returns error changeset" do
      tohum = tohum_fixture()
      assert {:error, %Ecto.Changeset{}} = Tarim.update_tohum(tohum, @invalid_attrs)
      assert tohum == Tarim.get_tohum!(tohum.id)
    end

    test "delete_tohum/1 deletes the tohum" do
      tohum = tohum_fixture()
      assert {:ok, %Tohum{}} = Tarim.delete_tohum(tohum)
      assert_raise Ecto.NoResultsError, fn -> Tarim.get_tohum!(tohum.id) end
    end

    test "change_tohum/1 returns a tohum changeset" do
      tohum = tohum_fixture()
      assert %Ecto.Changeset{} = Tarim.change_tohum(tohum)
    end
  end

  describe "gubreler" do
    alias Indeals.Tarim.Gubre

    @valid_attrs %{ad: "some ad", gecerlilik: ~D[2010-04-17], kilo: 42, kilo_fiyat: "120.5", makro: true, mikro: true, yer: "some yer"}
    @update_attrs %{ad: "some updated ad", gecerlilik: ~D[2011-05-18], kilo: 43, kilo_fiyat: "456.7", makro: false, mikro: false, yer: "some updated yer"}
    @invalid_attrs %{ad: nil, gecerlilik: nil, kilo: nil, kilo_fiyat: nil, makro: nil, mikro: nil, yer: nil}

    def gubre_fixture(attrs \\ %{}) do
      {:ok, gubre} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tarim.create_gubre()

      gubre
    end

    test "list_gubreler/0 returns all gubreler" do
      gubre = gubre_fixture()
      assert Tarim.list_gubreler() == [gubre]
    end

    test "get_gubre!/1 returns the gubre with given id" do
      gubre = gubre_fixture()
      assert Tarim.get_gubre!(gubre.id) == gubre
    end

    test "create_gubre/1 with valid data creates a gubre" do
      assert {:ok, %Gubre{} = gubre} = Tarim.create_gubre(@valid_attrs)
      assert gubre.ad == "some ad"
      assert gubre.gecerlilik == ~D[2010-04-17]
      assert gubre.kilo == 42
      assert gubre.kilo_fiyat == Decimal.new("120.5")
      assert gubre.makro == true
      assert gubre.mikro == true
      assert gubre.yer == "some yer"
    end

    test "create_gubre/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tarim.create_gubre(@invalid_attrs)
    end

    test "update_gubre/2 with valid data updates the gubre" do
      gubre = gubre_fixture()
      assert {:ok, gubre} = Tarim.update_gubre(gubre, @update_attrs)
      assert %Gubre{} = gubre
      assert gubre.ad == "some updated ad"
      assert gubre.gecerlilik == ~D[2011-05-18]
      assert gubre.kilo == 43
      assert gubre.kilo_fiyat == Decimal.new("456.7")
      assert gubre.makro == false
      assert gubre.mikro == false
      assert gubre.yer == "some updated yer"
    end

    test "update_gubre/2 with invalid data returns error changeset" do
      gubre = gubre_fixture()
      assert {:error, %Ecto.Changeset{}} = Tarim.update_gubre(gubre, @invalid_attrs)
      assert gubre == Tarim.get_gubre!(gubre.id)
    end

    test "delete_gubre/1 deletes the gubre" do
      gubre = gubre_fixture()
      assert {:ok, %Gubre{}} = Tarim.delete_gubre(gubre)
      assert_raise Ecto.NoResultsError, fn -> Tarim.get_gubre!(gubre.id) end
    end

    test "change_gubre/1 returns a gubre changeset" do
      gubre = gubre_fixture()
      assert %Ecto.Changeset{} = Tarim.change_gubre(gubre)
    end
  end

  describe "ekipmanlar" do
    alias Indeals.Tarim.Ekipman

    @valid_attrs %{cins: "some cins", fiyat: 42, gecerlilik: ~D[2010-04-17], marka: "some marka", model: "some model", yer: "some yer", özellik: "some özellik"}
    @update_attrs %{cins: "some updated cins", fiyat: 43, gecerlilik: ~D[2011-05-18], marka: "some updated marka", model: "some updated model", yer: "some updated yer", özellik: "some updated özellik"}
    @invalid_attrs %{cins: nil, fiyat: nil, gecerlilik: nil, marka: nil, model: nil, yer: nil, özellik: nil}

    def ekipman_fixture(attrs \\ %{}) do
      {:ok, ekipman} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tarim.create_ekipman()

      ekipman
    end

    test "list_ekipmanlar/0 returns all ekipmanlar" do
      ekipman = ekipman_fixture()
      assert Tarim.list_ekipmanlar() == [ekipman]
    end

    test "get_ekipman!/1 returns the ekipman with given id" do
      ekipman = ekipman_fixture()
      assert Tarim.get_ekipman!(ekipman.id) == ekipman
    end

    test "create_ekipman/1 with valid data creates a ekipman" do
      assert {:ok, %Ekipman{} = ekipman} = Tarim.create_ekipman(@valid_attrs)
      assert ekipman.cins == "some cins"
      assert ekipman.fiyat == 42
      assert ekipman.gecerlilik == ~D[2010-04-17]
      assert ekipman.marka == "some marka"
      assert ekipman.model == "some model"
      assert ekipman.yer == "some yer"
      assert ekipman.özellik == "some özellik"
    end

    test "create_ekipman/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tarim.create_ekipman(@invalid_attrs)
    end

    test "update_ekipman/2 with valid data updates the ekipman" do
      ekipman = ekipman_fixture()
      assert {:ok, ekipman} = Tarim.update_ekipman(ekipman, @update_attrs)
      assert %Ekipman{} = ekipman
      assert ekipman.cins == "some updated cins"
      assert ekipman.fiyat == 43
      assert ekipman.gecerlilik == ~D[2011-05-18]
      assert ekipman.marka == "some updated marka"
      assert ekipman.model == "some updated model"
      assert ekipman.yer == "some updated yer"
      assert ekipman.özellik == "some updated özellik"
    end

    test "update_ekipman/2 with invalid data returns error changeset" do
      ekipman = ekipman_fixture()
      assert {:error, %Ecto.Changeset{}} = Tarim.update_ekipman(ekipman, @invalid_attrs)
      assert ekipman == Tarim.get_ekipman!(ekipman.id)
    end

    test "delete_ekipman/1 deletes the ekipman" do
      ekipman = ekipman_fixture()
      assert {:ok, %Ekipman{}} = Tarim.delete_ekipman(ekipman)
      assert_raise Ecto.NoResultsError, fn -> Tarim.get_ekipman!(ekipman.id) end
    end

    test "change_ekipman/1 returns a ekipman changeset" do
      ekipman = ekipman_fixture()
      assert %Ecto.Changeset{} = Tarim.change_ekipman(ekipman)
    end
  end

  describe "araziler" do
    alias Indeals.Tarim.Arazi

    @valid_attrs %{ada_pafta: "some ada_pafta", fiyat: 42, gecerlilik: ~D[2010-04-17], il: "some il", ilce: "some ilce", kiralik: true, mahalle: "some mahalle", satılık: true, yuzolcum_m2: 42}
    @update_attrs %{ada_pafta: "some updated ada_pafta", fiyat: 43, gecerlilik: ~D[2011-05-18], il: "some updated il", ilce: "some updated ilce", kiralik: false, mahalle: "some updated mahalle", satılık: false, yuzolcum_m2: 43}
    @invalid_attrs %{ada_pafta: nil, fiyat: nil, gecerlilik: nil, il: nil, ilce: nil, kiralik: nil, mahalle: nil, satılık: nil, yuzolcum_m2: nil}

    def arazi_fixture(attrs \\ %{}) do
      {:ok, arazi} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tarim.create_arazi()

      arazi
    end

    test "list_araziler/0 returns all araziler" do
      arazi = arazi_fixture()
      assert Tarim.list_araziler() == [arazi]
    end

    test "get_arazi!/1 returns the arazi with given id" do
      arazi = arazi_fixture()
      assert Tarim.get_arazi!(arazi.id) == arazi
    end

    test "create_arazi/1 with valid data creates a arazi" do
      assert {:ok, %Arazi{} = arazi} = Tarim.create_arazi(@valid_attrs)
      assert arazi.ada_pafta == "some ada_pafta"
      assert arazi.fiyat == 42
      assert arazi.gecerlilik == ~D[2010-04-17]
      assert arazi.il == "some il"
      assert arazi.ilce == "some ilce"
      assert arazi.kiralik == true
      assert arazi.mahalle == "some mahalle"
      assert arazi.satılık == true
      assert arazi.yuzolcum_m2 == 42
    end

    test "create_arazi/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tarim.create_arazi(@invalid_attrs)
    end

    test "update_arazi/2 with valid data updates the arazi" do
      arazi = arazi_fixture()
      assert {:ok, arazi} = Tarim.update_arazi(arazi, @update_attrs)
      assert %Arazi{} = arazi
      assert arazi.ada_pafta == "some updated ada_pafta"
      assert arazi.fiyat == 43
      assert arazi.gecerlilik == ~D[2011-05-18]
      assert arazi.il == "some updated il"
      assert arazi.ilce == "some updated ilce"
      assert arazi.kiralik == false
      assert arazi.mahalle == "some updated mahalle"
      assert arazi.satılık == false
      assert arazi.yuzolcum_m2 == 43
    end

    test "update_arazi/2 with invalid data returns error changeset" do
      arazi = arazi_fixture()
      assert {:error, %Ecto.Changeset{}} = Tarim.update_arazi(arazi, @invalid_attrs)
      assert arazi == Tarim.get_arazi!(arazi.id)
    end

    test "delete_arazi/1 deletes the arazi" do
      arazi = arazi_fixture()
      assert {:ok, %Arazi{}} = Tarim.delete_arazi(arazi)
      assert_raise Ecto.NoResultsError, fn -> Tarim.get_arazi!(arazi.id) end
    end

    test "change_arazi/1 returns a arazi changeset" do
      arazi = arazi_fixture()
      assert %Ecto.Changeset{} = Tarim.change_arazi(arazi)
    end
  end
end
