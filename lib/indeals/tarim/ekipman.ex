defmodule Indeals.Tarim.Ekipman do
  use Ecto.Schema
  import Ecto.Changeset
  alias Indeals.Tarim.Ekipman


  schema "ekipmanlar" do
    field :cins, :string
    field :fiyat, :integer
    field :gecerlilik, :date
    field :marka, :string
    field :model, :string
    field :yer, :string
    field :özellik, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Ekipman{} = ekipman, attrs) do
    ekipman
    |> cast(attrs, [:cins, :marka, :model, :özellik, :yer, :fiyat, :gecerlilik])
    |> validate_required([:cins, :marka, :model, :özellik, :yer, :fiyat, :gecerlilik])
  end
end
