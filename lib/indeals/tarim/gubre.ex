defmodule Indeals.Tarim.Gubre do
  use Ecto.Schema
  import Ecto.Changeset
  alias Indeals.Tarim.Gubre
  import Ecto.Query, only: [from: 2]


  schema "gubreler" do
    field :ad, :string
    field :gecerlilik, :date
    field :kilo, :integer
    field :kilo_fiyat, :decimal
    field :makro, :boolean, default: false
    field :mikro, :boolean, default: false
    field :yer, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Gubre{} = gubre, attrs) do
    gubre
    |> cast(attrs, [:ad, :makro, :mikro, :kilo, :yer, :kilo_fiyat, :gecerlilik])
    |> validate_required([:ad, :makro, :mikro, :kilo, :yer, :kilo_fiyat, :gecerlilik])
  end

  def search(query, search_term) do
      wildcard_search = "%#{search_term}%"
      from gubre in query,
      where: ilike(gubre.ad, ^wildcard_search),
      or_where: ilike(gubre.yer, ^wildcard_search)
      #,order_by: [{:asc, deal.valid}]

  end

end
