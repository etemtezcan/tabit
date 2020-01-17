defmodule Indeals.Repo.Migrations.CreateTohumlar do
  use Ecto.Migration

  def change do
    create table(:tohumlar) do
      add :cins, :string
      add :çeşit, :string
      add :açıklama, :string
      add :yer, :string
      add :kilo_fiyat, :decimal
      add :gecerlilik, :date
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:tohumlar, [:user_id])
  end
end
