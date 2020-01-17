defmodule Indeals.Repo.Migrations.CreateEkipmanlar do
  use Ecto.Migration

  def change do
    create table(:ekipmanlar) do
      add :cins, :string
      add :marka, :string
      add :model, :string
      add :özellik, :string
      add :yer, :string
      add :fiyat, :integer
      add :gecerlilik, :date
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:ekipmanlar, [:user_id])
  end
end
