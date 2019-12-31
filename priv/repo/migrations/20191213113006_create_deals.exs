defmodule Indeals.Repo.Migrations.CreateDeals do
  use Ecto.Migration

  def change do
    create table(:deals) do
      add :title, :string
      add :description, :text
      add :price, :float
      add :valid, :date
      add :status, :string
      add :url, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:deals, [:user_id])
  end
end
