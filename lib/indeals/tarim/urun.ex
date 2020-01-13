defmodule Indeals.Tarim.Urun do
  use Ecto.Schema
  import Ecto.Changeset
  alias Indeals.Tarim.Urun
  import Ecto.Query, only: [from: 2]


  schema "urunler" do
    field :açıklama, :string
    field :cins, :string
    field :gecerlilik, :date
    field :kilo_fiyat, :decimal
    field :miktar_ton, :integer
    field :uretim_tarihi, :date
    field :yer, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Urun{} = urun, attrs) do
    urun
    |> cast(attrs, [:cins, :açıklama, :yer, :miktar_ton, :kilo_fiyat, :uretim_tarihi, :gecerlilik])
    |> validate_required([:cins, :açıklama, :yer, :miktar_ton, :kilo_fiyat, :uretim_tarihi, :gecerlilik])
  end
end
