defmodule Indeals.Repo.Migrations.CreateGubreler do
  use Ecto.Migration

  def change do
    create table(:gubreler) do
      add :ad, :string
      add :makro, :boolean, default: false, null: false
      add :mikro, :boolean, default: false, null: false
      add :kilo, :integer
      add :yer, :string
      add :kilo_fiyat, :decimal
      add :gecerlilik, :date
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:gubreler, [:user_id])
  end
end
