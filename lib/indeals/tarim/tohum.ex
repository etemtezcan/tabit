defmodule Indeals.Tarim.Tohum do
  use Ecto.Schema
  import Ecto.Changeset
  alias Indeals.Tarim.Tohum
  import Ecto.Query, only: [from: 2]


  schema "tohumlar" do
    field :açıklama, :string
    field :cins, :string
    field :gecerlilik, :date
    field :kilo_fiyat, :decimal
    field :yer, :string
    field :çeşit, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Tohum{} = tohum, attrs) do
    tohum
    |> cast(attrs, [:cins, :çeşit, :açıklama, :yer, :kilo_fiyat, :gecerlilik])
    |> validate_required([:cins, :çeşit, :açıklama, :yer, :kilo_fiyat, :gecerlilik])
  end

  def search(query, search_term) do
      wildcard_search = "%#{search_term}%"
      from tohum in query,
      where: ilike(tohum.cins, ^wildcard_search),
      or_where: ilike(tohum.çeşit, ^wildcard_search),
      or_where: ilike(tohum.açıklama, ^wildcard_search),
      or_where: ilike(tohum.yer, ^wildcard_search)
      #,order_by: [{:asc, deal.valid}]

  end

end
