defmodule Indeals.Tarim.Arazi do
  use Ecto.Schema
  import Ecto.Changeset
  alias Indeals.Tarim.Arazi


  schema "araziler" do
    field :ada_pafta, :string
    field :fiyat, :integer
    field :gecerlilik, :date
    field :il, :string
    field :ilce, :string
    field :kiralik, :boolean, default: false
    field :mahalle, :string
    field :satılık, :boolean, default: false
    field :yuzolcum_m2, :integer
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Arazi{} = arazi, attrs) do
    arazi
    |> cast(attrs, [:il, :ilce, :mahalle, :yuzolcum_m2, :kiralik, :satılık, :fiyat, :ada_pafta, :gecerlilik])
    |> validate_required([:il, :ilce, :mahalle, :yuzolcum_m2, :kiralik, :satılık, :fiyat, :ada_pafta, :gecerlilik])
  end
end
