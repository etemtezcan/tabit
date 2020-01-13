defmodule Indeals.Tarim.Arazi do
  use Ecto.Schema
  import Ecto.Changeset
  alias Indeals.Tarim.Arazi
  import Ecto.Query, only: [from: 2]
  alias Indeals.Repo


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

  def search(query, search_term) do
      wildcard_search = "%#{search_term}%"
  
      from arazi in query,
      where: ilike(arazi.il, ^wildcard_search),
      or_where: ilike(arazi.ilce, ^wildcard_search) 
      #,order_by: [{:asc, deal.valid}]

    end
  def list_araziler(params) do
    search_term= get_in(params, ["query"])
    Arazi
    |> Arazi.search(search_term)
    |> Repo.all()
  end

end
