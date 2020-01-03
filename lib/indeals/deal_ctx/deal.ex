defmodule Indeals.DealCtx.Deal do
  use Timex
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]
  alias Indeals.DealCtx.Deal


  schema "deals" do
    field :description, :string
    field :price, :float
    field :status, :string
    field :title, :string
    field :url, :string
    field :valid, :date
    belongs_to :user , Indeals.Account.User
    field :is_expired, :boolean # valid2 time past
    timestamps()
  end

  @doc false
  def changeset(%Deal{} = deal, attrs) do
    deal
    |> cast(attrs, [:title, :description, :price, :valid, :status, :url])
    |> validate_required([:title, :description, :price, :valid])
  end

    @doc false
    def submit_changeset(%Deal{} = deal, attrs, user_id) do
      deal
      |> cast(attrs, [:title, :description, :price, :valid, :status, :url])
      #  |> cast(attrs, [:description, :user_id, :is_external, :is_remote, :location, :salary, :skills, :title, :url, :status])
     # |> validate_url(:url, message: "URL is not a valid URL!")
      |> validate_required([:title, :description])
     # |> validate_inclusion(:status, ["active", "draft"])
     # |> validate_inclusion(:location, get_locations())
      |> validate_length(:title, min: 5, max: 60)
      |> validate_length(:description, max: 5000)
      |> put_change(:user_id, user_id)
    end
  
    @doc false
    def update_changeset(%Deal{} = deal, attrs) do
      deal
      |> cast(attrs, [:title, :description, :price, :valid, :status, :url])
      #  |> cast(attrs, [:description, :is_external, :is_remote, :location, :salary, :skills, :title, :url, :status])
     # |> validate_url(:url, message: "URL is not a valid URL!")
      |> validate_required([:title, :description])
     # |> validate_inclusion(:status, ["active", "draft"])
     # |> validate_inclusion(:location, get_locations())
      |> validate_length(:title, min: 5, max: 60)
      |> validate_length(:description, max: 5000)
    end

    @doc false
    def repost_changeset(%Deal{} = deal) do
      deal
      |> cast(%{}, [])
      |> put_change(:inserted_at, NaiveDateTime.utc_now())
      |> put_change(:update_at, NaiveDateTime.utc_now())
    #  |> put_change(:status, "active")
    end
  

    def search(query, search_term) do
      wildcard_search = "%#{search_term}%"
  
      from deal in query,
      where: ilike(deal.title, ^wildcard_search),
      or_where: ilike(deal.description, ^wildcard_search),
      order_by: [{:asc, deal.valid}]

    end

 
end
