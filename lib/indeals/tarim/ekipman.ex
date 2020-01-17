defmodule Indeals.Tarim.Ekipman do
  use Ecto.Schema
  import Ecto.Changeset
  alias Indeals.Tarim.Ekipman
  import Ecto.Query, only: [from: 2]


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
    def search(query, search_term) do
      wildcard_search = "%#{search_term}%"
  
      from ekipman in query,
      where: ilike(ekipman.cins, ^wildcard_search),
      or_where: ilike(ekipman.marka, ^wildcard_search),
      or_where: ilike(ekipman.model, ^wildcard_search),
      or_where: ilike(ekipman.yer, ^wildcard_search)
      #,order_by: [{:asc, deal.valid}]

    end

end
