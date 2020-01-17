defmodule Indeals.Repo.Migrations.CreateAraziler do
  use Ecto.Migration

  def change do
    create table(:araziler) do
      add :il, :string
      add :ilce, :string
      add :mahalle, :string
      add :yuzolcum_m2, :integer
      add :kiralik, :boolean, default: false, null: false
      add :satılık, :boolean, default: false, null: false
      add :fiyat, :integer
      add :ada_pafta, :string
      add :gecerlilik, :date
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:araziler, [:user_id])
  end
end
